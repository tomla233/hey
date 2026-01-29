import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hey/models/hot/SliderInfo.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<SliderInfo> sliderList;
  const CustomCarouselSlider({super.key, required this.sliderList});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  // 轮播图索引
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 单个指示器横线的宽度
    final indicatorWidth = 16.0;
    // 指示器总宽度
    final totalIndicatorWidth =
        indicatorWidth * widget.sliderList.length +
        8 * (widget.sliderList.length - 1);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            viewportFraction: 1.0,
            autoPlay: true,
            clipBehavior: Clip.antiAlias,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.sliderList.map((item) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            blurRadius: 2,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

        // 指示器
        Positioned(
          bottom: 8,
          child: SizedBox(
            width: totalIndicatorWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.sliderList.length, (index) {
                return AnimatedContainer(
                  width: indicatorWidth,
                  height: 3.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: _currentIndex == index
                        ? Colors.white
                        : const Color(0xFF7C7D78),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
