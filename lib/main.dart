import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/albums.dart';
import 'package:sns_app/pages/home.dart';
import 'package:sns_app/pages/pictures.dart';
import 'package:sns_app/pages/posts.dart';

void main() {
  runApp(const ProviderScope(child: MySnsApp()));
}

class MySnsApp extends StatelessWidget {
  const MySnsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sns App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: 'main',
      routes: <String, WidgetBuilder>{'main': (context) => const MainPage()},
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  final pages = const [PostsPage(), AlbumsPage(), PicturesPage(), HomePage()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return pages[pageIndex];
  }
}
