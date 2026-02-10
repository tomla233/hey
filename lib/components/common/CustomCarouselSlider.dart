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
  final bool isActive;
  const CustomCarouselSlider({
    super.key,
    required this.sliderList,
    this.sliderHeight = 180.0,
    this.showTitle = true,
    this.autoPlay = true,
    required this.isActive,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  int _currentIndex = 0;
  //遮罩层高度
  double get overlayHeight => widget.sliderHeight == null? 60 : widget.sliderHeight! * 0.33;
  VideoPlayerController? _controller;

  bool _isPlaying = false;
  bool _isInitialized = false;
  bool _isInitializing = false; // ⭐ 加载中状态

  bool _isVideo(String? url) {
    if (url == null) return false;
    return url.endsWith('.mp4') ||
        url.endsWith('.mov') ||
        url.endsWith('.webm');
  }

  /// 点击播放
  Future<void> _playVideo(String videoUrl) async {
    // 已初始化 → 切换播放/暂停
    if (_controller != null && _isInitialized) {
      if (_isPlaying) {
        await _controller!.pause();
        setState(() => _isPlaying = false);
      } else {
        await _controller!.play();
        setState(() => _isPlaying = true);
      }
      return;
    }

    // 初始化中，直接 return，防止重复点击
    if (_isInitializing) return;

    setState(() {
      _isInitializing = true;
    });

    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

    try {
      await _controller!.initialize();
      await _controller!.setLooping(true);
      await _controller!.play();

      setState(() {
        _isInitialized = true;
        _isPlaying = true;
        _isInitializing = false;
      });
    } catch (e) {
      debugPrint('Video init error: $e');
      _disposeVideo();
    }
  }

  void _disposeVideo() {
    _controller?.pause();
    _controller?.dispose();
    _controller = null;

    _isPlaying = false;
    _isInitialized = false;
    _isInitializing = false;
  }

  @override
  void dispose() {
    _disposeVideo();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomCarouselSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 🔴 从 active → inactive
    if (oldWidget.isActive && !widget.isActive) {
      _resetVideoUI();
    }
  }

  void _resetVideoUI() {
    _controller?.pause();
    setState(() {
      _isPlaying = false;
      _isInitialized = false; // ⭐ 必须
      _isInitializing = false;
    });
  }

  String? _getCoverUrl(SliderInfo item) {
    if (_isVideo(item.videoUrl)) {
      return item.videoCoverUrl ?? item.imageUrl;
    }
    return item.imageUrl;
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
                _disposeVideo();
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
                  /// 🎬 视频播放
                  if (isVideo && isCurrent && _isInitialized)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _controller!.value.size.width,
                            height: _controller!.value.size.height,
                            child: VideoPlayer(_controller!),
                          ),
                        ),
                      ),
                    )
                  else
                    Image.network(
                      _getCoverUrl(item) ?? '',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          Image.asset('lib/assets/box.png'),
                    ),

                  /// ⏳ 加载中
                  if (isVideo && isCurrent && _isInitializing)
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(14),
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Colors.white,
                      ),
                    ),

                  /// ▶️ 播放按钮
                  if (isVideo && isCurrent && !_isInitializing && !_isPlaying)
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
                  //  遮罩层
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: overlayHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0),
                            Colors.black.withValues(alpha: 0.6),
                          ],
                        ),
                      ),
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
                            Shadow(blurRadius: 2, color: Colors.black54),
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
                  color: _currentIndex == index ? Colors.white : Colors.white38,
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
