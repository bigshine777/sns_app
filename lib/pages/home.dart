import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/albums.dart';
import 'package:sns_app/pages/footer.dart';
import 'package:sns_app/pages/pictures.dart';
import 'package:sns_app/pages/posts.dart';
import 'package:sns_app/pages/setting.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final albumsAsync = ref.watch(albumsNotifierProvider);
    final usersAsync = ref.watch(usersNotifierProvider);
    final picturesAsync = ref.watch(picturesNotifierProvider);
    final postsAsync = ref.watch(postsNotifierProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$username のお気に入り',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.settings, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue[400],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.textsms_outlined, color: Colors.white)),
              Tab(icon: Icon(Icons.filter, color: Colors.white)),
              Tab(icon: Icon(Icons.crop_original, color: Colors.white)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            postsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (posts) {
                if (posts.isEmpty) {
                  return const Center(child: Text('投稿はありません'));
                }
                final filteredPosts = posts.where((p) => p.isLiked).toList();

                return ListView.builder(
                  itemCount: filteredPosts.length,
                  itemBuilder: (context, index) {
                    final post = filteredPosts[index];
                    return PostCard(post: post);
                  },
                );
              },
              error: (err, stack) => Text('Error: $err'),
            ),
            albumsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
              data: (albums) {
                if (albums.isEmpty) {
                  return const Center(child: Text('アルバムはありません'));
                }

                if (usersAsync.isLoading || picturesAsync.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final users = usersAsync.value!;
                final pictures = picturesAsync.value!;
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
