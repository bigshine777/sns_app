import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/app_bar.dart';
import 'package:sns_app/pages/change_username.dart';
import 'package:sns_app/pages/footer.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: '設定', isSetting: false),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChangeUsernamePage(),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 1,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.grey[800],
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
                    Text(
                      '名前を登録',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    const Icon(Icons.chevron_right, size: 40),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.white
                : Colors.grey[800],
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
                  Text(
                    'ダークモード',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
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
