import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:hey/models/hot/SliderInfo.dart';
import 'package:hey/utils/MsgUtil.dart';

class CustomCarouselSlider extends StatefulWidget {
  final List<SliderInfo> sliderList;
  final double? sliderHeight;
  final bool? showTitle;
  final bool? autoPlay;
  const CustomCarouselSlider({
    super.key,
    required this.sliderList,
    this.sliderHeight = 180.0,
    this.showTitle = true,
    this.autoPlay = true,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;

  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _isInitialized = false;

  bool _isVideo(String? url) {
    if (url == null) return false;
    return url.endsWith('.mp4') ||
        url.endsWith('.mov') ||
        url.endsWith('.webm');
  }

  /// 初始化并播放视频
  void _playVideo(String videoUrl) async {
    // 如果已经有视频在播 → 切换为暂停
    if (_controller != null && _isInitialized) {
      if (_isPlaying) {
        _controller!.pause();
        setState(() {
          _isPlaying = false;
        });
        return;
      } else {
        _controller!.play();
        setState(() {
          _isPlaying = true;
        });
        return;
      }
    }

    // 第一次点击：创建 controller
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    try {
      await _controller!.initialize();
      _controller!
        ..setLooping(true)
        ..play();

      setState(() {
        _isInitialized = true;
        _isPlaying = true;
      });
    } catch (e) {
      debugPrint('Video init error: $e');
    }
  }

  /// 切页 / 退出时释放
  void _disposeVideo() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    _isInitialized = false;
    _isPlaying = false;
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.sliderHeight,
            viewportFraction: 1.0,
            autoPlay: widget.autoPlay ?? true,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                _disposeVideo(); // 🔴 切页必须销毁
                _currentIndex = index;
              });
            },
          ),
          items: widget.sliderList.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final bool isCurrent = index == _currentIndex;
            final bool isVideo = _isVideo(item.videoUrl);

            return GestureDetector(
              onTap: () {
                if (isVideo && isCurrent) {
                  _playVideo(item.videoUrl!);
                } else {
                  MsgUtil.show("点击了轮播图，社区id：${item.communityId}");
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  /// 视频
                  if (isVideo && isCurrent && _isInitialized)
                    AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  else
                    Image.network(
                      item.imageUrl ?? '',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Image.asset('lib/assets/box.png'),
                    ),

                  /// ▶️ 播放按钮（未播放 or 已暂停）
                  if (isVideo && (!_isPlaying || !_isInitialized))
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),

                  /// 标题
                  if (widget.showTitle == true)
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Text(
                        item.title ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 2,
                              color: Colors.black54,
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

        /// 指示器
        Positioned(
          bottom: 8,
          child: Row(
            children: List.generate(widget.sliderList.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentIndex == index ? 16 : 8,
                height: 3,
                decoration: BoxDecoration(
                  color: _currentIndex == index
                      ? Colors.white
                      : Colors.white38,
                  borderRadius: BorderRadius.circular(2),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
