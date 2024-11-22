import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatefulWidget {
  final String videoPath;
  final ScrollController scrollController;

  const VideoBackground({
    super.key,
    required this.videoPath,
    required this.scrollController,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _videoController;
  double _lastScrollOffset = 0;
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..setLooping(false)
      ..setVolume(0)
      ..initialize().then((_) {
        setState(() {});
      });

    widget.scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    // Clear the previous timer to debounce scroll events
    _scrollTimer?.cancel();

    final currentScrollOffset = widget.scrollController.position.pixels;

    if (currentScrollOffset > _lastScrollOffset) {
      // Scrolling down
      _playVideoForward();
    } else if (currentScrollOffset < _lastScrollOffset) {
      // Scrolling up
      _playVideoBackward();
    }

    _lastScrollOffset = currentScrollOffset;

    // Pause the video after a short delay when scrolling stops
    _scrollTimer = Timer(const Duration(milliseconds: 300), () {
      _videoController.pause();
    });
  }

  void _playVideoForward() {
    if (!_videoController.value.isPlaying) {
      _videoController.setPlaybackSpeed(1.0); // Normal forward speed
      _videoController.play();
    }
  }

  void _playVideoBackward() {
    if (!_videoController.value.isPlaying) {
      _videoController.setPlaybackSpeed(-1.0); // Reverse playback
      _videoController.play();
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    widget.scrollController.removeListener(_handleScroll);
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width,
              height: _videoController.value.size.height,
              child: VideoPlayer(_videoController),
            ),
          )
        : const SizedBox();
  }
}
