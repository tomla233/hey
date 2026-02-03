//黑盒促销
import 'package:flutter/material.dart';
import 'package:hey/mock/GameService.dart';
import 'package:hey/models/game/GameInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class BoxPromotion extends StatelessWidget {
  BoxPromotion({super.key});
  void _onMoreTap() {
    MsgUtil.show('更多');
  }

  final List<GameInfo> _gameList = GameService().gameInfoList;
  @override
  Widget build(BuildContext context) {
    //列之间的水平间距
    final double hSpacing = 14;
    double sizeBoxHeight = 160;
    double ContainerWidth = 110;
    final double dividerY = sizeBoxHeight * 2 / 3;
    final Color borderColor = const Color(0xFFF4F4F5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '黑盒热销',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            GestureDetector(
              onTap: _onMoreTap,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '更多',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: sizeBoxHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _gameList.length,
            separatorBuilder: (context, index) => SizedBox(width: hSpacing),
            itemBuilder: (context, index) {
              return Container(
                width: ContainerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor, width: 0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: dividerY,
                      child: Container(height: 0.8, color: borderColor),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
