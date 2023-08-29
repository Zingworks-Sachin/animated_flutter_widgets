import 'package:flutter/material.dart';

class ImageColorChangeAnimationUtility {
  static Widget animatedColorImage({
    required String imagePath,
    required Color initialColor,
    required Color targetColor,
    required Duration duration,
  }) {
    return _ColorChangeAnimationWidget(
      imagePath: imagePath,
      initialColor: initialColor,
      targetColor: targetColor,
      duration: duration,
    );
  }
}

class _ColorChangeAnimationWidget extends StatefulWidget {
  final String imagePath;
  final Color initialColor;
  final Color targetColor;
  final Duration duration;

  const _ColorChangeAnimationWidget({
    required this.imagePath,
    required this.initialColor,
    required this.targetColor,
    required this.duration,
  });

  @override
  _ColorChangeAnimationWidgetState createState() =>
      _ColorChangeAnimationWidgetState();
}

class _ColorChangeAnimationWidgetState
    extends State<_ColorChangeAnimationWidget> {
  late Color _currentColor;
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.initialColor;
  }

  void _changeColor() {
    setState(() {
      _showImage = !_showImage;
      _currentColor = _showImage ? widget.targetColor : widget.initialColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: AnimatedContainer(
        duration: widget.duration,
        curve: Curves.easeInOut,
        width: _showImage ? 200 : 0,
        height: _showImage ? 200 : 0,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            _currentColor,
            BlendMode.color,
          ),
          child: Image.asset(widget.imagePath),
        ),
      ),
    );
  }
}
