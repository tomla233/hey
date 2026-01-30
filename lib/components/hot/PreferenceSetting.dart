import 'package:flutter/material.dart';

class PreferenceSetting extends StatefulWidget {
  const PreferenceSetting({super.key});

  @override
  State<PreferenceSetting> createState() => _PreferenceSettingState();
}

class _PreferenceSettingState extends State<PreferenceSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('偏好设置')),
      body: const Center(child: Text('偏好设置')),
    );
  }
}
