import 'package:flutter/material.dart';
import 'package:hey/components/common/Search.dart';

class PreferenceSetting extends StatefulWidget {
  const PreferenceSetting({super.key});

  @override
  State<PreferenceSetting> createState() => _PreferenceSettingState();
}

class _PreferenceSettingState extends State<PreferenceSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '偏好设置',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 30,
              child: Search(
                onTextChanged: (String value) {
                  print('搜索内容变化：$value');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
