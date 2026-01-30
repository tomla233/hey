import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';

///自定义搜索框
class Search extends StatelessWidget {
  final Function(String value) onTextChanged;
  const Search({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        // 开启背景填充
        filled: true,
        fillColor: const Color(0xFFF3F4F6),
        hintText: '搜索游戏分区',
        hintStyle: const TextStyle(
          color: ColorConstants.primaryGray,
          fontSize: 14,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: ColorConstants.primaryGray,
          size: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      ),
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {
        onTextChanged(value);
      },
    );
  }
}
