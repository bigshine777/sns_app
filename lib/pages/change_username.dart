import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/notifiers.dart';
import 'package:sns_app/pages/app_bar.dart';

class ChangeUsernamePage extends ConsumerWidget {
  const ChangeUsernamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    var username = '';

    return Scaffold(
      appBar: const CustomAppBar(title: 'ユーザー名を変更', isSetting: false),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'ユーザー名'),
                validator: (value) {
                  if (value == null || value.isEmpty) return '入力してください';
                  return null;
                },
                onSaved: (value) => username = value ?? '',
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                      ref.read(usernameProvider.notifier).username = username;
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                        ? Colors.blue[400]
                        : Colors.grey[800],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text('保存'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
