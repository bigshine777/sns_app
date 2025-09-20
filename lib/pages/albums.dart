import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/album.dart';
import 'package:sns_app/models/picture.dart';
import 'package:sns_app/models/user.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/footer.dart';
import 'package:sns_app/pages/pictures.dart';

class AlbumsPage extends ConsumerWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsAsync = ref.watch(albumsNotifierProvider);
    final usersAsync = ref.watch(usersNotifierProvider);
    final picturesAsync = ref.watch(picturesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'アルバム',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: albumsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (albums) {
          if (albums.isEmpty) return const Center(child: Text('アルバムはありません'));

          if (usersAsync.isLoading || picturesAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = usersAsync.value!;
          final pictures = picturesAsync.value!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final album = albums[index];
              final user = users.firstWhere((u) => u.id == album.userId);
              // final picture = pictures.
              //firstWhere((p) => p.albumId == album.id);

              return AlbumCard(album: album, user: user, pictures: pictures);
            },
          );
        },
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class AlbumCard extends ConsumerWidget {
  final Album album;
  final User user;
  final List<Picture> pictures;

  const AlbumCard({
    super.key,
    required this.album,
    required this.user,
    required this.pictures,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PicturesPage(albumId: album.id),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://placehold.jp/160x160.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Text('${user.name}\n@${user.username}'),
            ),
            Positioned(
              left: 15,
              top: 70,
              child: SizedBox(
                width: 160,
                child: Text(
                  album.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: InkWell(
                onTap: () {
                  ref
                      .read(albumsNotifierProvider.notifier)
                      .toggleLike(album.id);

                  for (var picture in pictures) {
                    if (picture.albumId == album.id &&
                        !album.isLiked &&
                        !picture.isLiked) {
                      ref
                          .read(picturesNotifierProvider.notifier)
                          .toggleLike(picture.id);
                    }
                  }
                },
                child: Icon(
                  album.isLiked ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
