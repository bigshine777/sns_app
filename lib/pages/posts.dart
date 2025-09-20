import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/post.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/footer.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '投稿',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: posts.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (posts) {
          if (posts.isEmpty) {
            return const Center(child: Text('投稿はありません'));
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(post: post);
            },
          );
        },
        error: (err, stack) => Text('Error: $err'),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class PostCard extends ConsumerWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersNotifierProvider);

    return Card(
      margin: const EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) => users.when(
                loading: () => const Center(
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  ),
                ),
                data: (users) {
                  final user = users.firstWhere(
                    (user) => user.id == post.userId,
                  );
                  return Text(
                    '${user.name}  @${user.username}',
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  );
                },
                error: (err, stack) => Text('Error: $err'),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              post.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              post.body,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  ref.read(postsNotifierProvider.notifier).toggleLike(post.id);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_outline,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
