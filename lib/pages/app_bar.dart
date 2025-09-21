import 'package:flutter/material.dart';
import 'package:sns_app/pages/setting.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isSetting;
  const CustomAppBar({super.key, required this.title, required this.isSetting});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.blue[400]
          : Colors.grey[800],
      actions: isSetting
          ? [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white, size: 32),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                ),
              ),
            ]
          : null,
      bottom: isSetting
          ? const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.textsms_outlined, color: Colors.white)),
                Tab(icon: Icon(Icons.filter, color: Colors.white)),
                Tab(icon: Icon(Icons.crop_original, color: Colors.white)),
              ],
            )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (isSetting ? kTextTabBarHeight : 0));
}
