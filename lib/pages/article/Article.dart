import 'package:flutter/material.dart';
import 'package:hey/constant/ColorConstants.dart';
import 'package:hey/store/example/counter.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}
class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 0.17,
              color: ColorConstants.primaryGray,
              width: double.infinity,
            ),
            Observer(
             builder: (_) => Text(
                '全局计数：${counter.value}',
              ),
            ),
            ElevatedButton(
              onPressed: () => counter.increment(),
              child: const Text('首页增加计数'),
            ),
            const Expanded(child: Text('data')),
          ],
        ),
      ),
    );
  }
}
