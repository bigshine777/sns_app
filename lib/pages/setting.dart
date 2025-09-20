import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/footer.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '設定',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 20,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('名前を登録', style: TextStyle(fontSize: 20)),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.chevron_right, size: 40),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 20,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ダークモード', style: TextStyle(fontSize: 20)),
                  Switch(
                    value: isDark,
                    onChanged: (value) {
                      ref.read(isDarkProvider.notifier).isDark = !isDark;
                      value = isDark;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
