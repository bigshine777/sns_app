import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/picture.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/app_bar.dart';
import 'package:sns_app/pages/footer.dart';

class PicturesPage extends ConsumerWidget {
  final int? albumId;
  const PicturesPage({this.albumId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final picturesAsync = ref.watch(picturesProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: '写真', isSetting: false),
      body: picturesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (pictures) {
          if (pictures.isEmpty) return const Center(child: Text('写真はありません'));

          final filteredPictures = albumId == null
              ? pictures
              : pictures.where((p) => p.albumId == albumId).toList();

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
      bottomNavigationBar: const Footer(),
    );
  }
}

class PictureCard extends ConsumerWidget {
  final Picture picture;

  const PictureCard({super.key, required this.picture});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://placehold.jp/160x160.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: InkWell(
              onTap: () {
                ref.read(picturesProvider.notifier).toggleLike(picture.id);
              },
              child: Icon(
                picture.isLiked ? Icons.favorite : Icons.favorite_outline,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
