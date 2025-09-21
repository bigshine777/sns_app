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

class MySnsApp extends ConsumerWidget {
  const MySnsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);
    return MaterialApp(
      title: 'Sns App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        brightness: Brightness.light,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
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
