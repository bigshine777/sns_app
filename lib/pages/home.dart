import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/albums.dart';
import 'package:sns_app/pages/app_bar.dart';
import 'package:sns_app/pages/footer.dart';
import 'package:sns_app/pages/pictures.dart';
import 'package:sns_app/pages/posts.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final postsPageAsync = ref.watch(postsPageProvider);
    final albumsPageAsync = ref.watch(albumsPageProvider);
    final picturesAsync = ref.watch(picturesProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: '$username のお気に入り', isSetting: true),
        body: TabBarView(
          children: [
            postsPageAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (data) {
                final posts = data.posts;
                final users = data.users;
                if (posts.isEmpty) {
                  return const Center(child: Text('投稿はありません'));
                }
                final filteredPosts = posts.where((p) => p.isLiked).toList();

                return ListView.builder(
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];
                    final user = users.firstWhere((u) => u.id == post.userId);
                    return PostCard(post: post, user: user);
                  },
                );
              },
              error: (err, stack) => Text('Error: $err'),
            ),
            albumsPageAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
              data: (data) {
                final albums = data.albums;
                final users = data.users;
                final pictures = data.pictures;

                if (albums.isEmpty) {
                  return const Center(child: Text('アルバムはありません'));
                }
                final filteredAlbums = albums.where((a) => a.isLiked).toList();

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredAlbums.length,
                  itemBuilder: (context, index) {
                    final album = filteredAlbums[index];
                    final user = users.firstWhere((u) => u.id == album.userId);

                    return AlbumCard(
                      album: album,
                      user: user,
                      pictures: pictures,
                    );
                  },
                );
              },
            ),
            picturesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
              data: (pictures) {
                if (pictures.isEmpty) {
                  return const Center(child: Text('写真はありません'));
                }

                final filteredPictures = pictures
                    .where((p) => p.isLiked)
                    .toList();

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: filteredPictures.length,
                  itemBuilder: (context, index) {
                    final picture = filteredPictures[index];
                    return PictureCard(picture: picture);
                  },
                );
              },
            ),
          ],
        ),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}
