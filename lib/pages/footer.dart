import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.textsms_outlined),
          label: '投稿',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.filter), label: 'アルバム'),
        BottomNavigationBarItem(icon: Icon(Icons.crop_original), label: '写真'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
      ],
      onTap: (final index) {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
        ref.read(pageIndexProvider.notifier).index = index;
      },
      currentIndex: pageIndex,
    );
  }
}
