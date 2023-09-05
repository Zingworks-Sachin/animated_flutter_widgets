import 'package:flutter/material.dart';

/// A utility class for creating an animated color change image.
class ImageColorChangeAnimationUtility {
  /// Creates an animated color change image widget.
  static Widget animatedColorImage({
    required String imagePath,
    required Color initialColor,
    required List<Color> colorArray,
    required Duration duration,
  }) {
    return _ColorChangeAnimationWidget(
      imagePath: imagePath,
      initialColor: initialColor,
      colorArray: colorArray,
      duration: duration,
    );
  }
}

class _ColorChangeAnimationWidget extends StatefulWidget {
  final String imagePath;
  final Color initialColor;
  final List<Color> colorArray;
  final Duration duration;

  const _ColorChangeAnimationWidget({
    required this.imagePath,
    required this.initialColor,
    required this.colorArray,
    required this.duration,
  });

  @override
  _ColorChangeAnimationWidgetState createState() =>
      _ColorChangeAnimationWidgetState();
}

class _ColorChangeAnimationWidgetState
    extends State<_ColorChangeAnimationWidget> {
  int _currentColorIndex = 0;
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    _startColorChangeLoop();
  }

  void _startColorChangeLoop() {
    Future.delayed(widget.duration, () {
      if (mounted) {
        setState(() {
          _showImage = !_showImage;
          _currentColorIndex =
              (_currentColorIndex + 1) % widget.colorArray.length;
          _startColorChangeLoop(); // Call the function again after the duration
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = widget.colorArray[_currentColorIndex];

    return AnimatedContainer(
      duration: widget.duration,
      curve: Curves.easeInOut,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(currentColor, BlendMode.color),
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
