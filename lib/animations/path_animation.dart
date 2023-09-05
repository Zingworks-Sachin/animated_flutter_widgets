import 'package:animated_flutter_widgets/enums/enums.dart'; // Import necessary dependencies.
import 'package:flutter/material.dart';

/// A widget that animates its child along a specified path.
class PathAnimation extends StatefulWidget {
  final Widget child;            /// The widget to be animated along the path.
  final Path path;               /// The path along which the child will be animated.
  final Duration duration;       /// The duration of the animation.
  final bool reversePath;       /// Whether to reverse the animation path.
  final PathDirection direction; /// The direction of the path animation.

  /// Constructor for the PathAnimation widget.
  const PathAnimation({
    Key? key,
    required this.child,
    required this.path,
    this.duration = const Duration(seconds: 3),
    this.reversePath = false,
    this.direction = PathDirection.forward,
  }) : super(key: key);

  @override
  State<PathAnimation> createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller; /// Controller for managing the animation.
  late Animation<double> _animation;    /// Animation object for tracking animation progress.

  @override
  void initState() {
    super.initState();
    /// Initialize the animation controller with the specified duration.
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final pathMetric = widget.path.computeMetrics().single;
    final pathLength = pathMetric.length;

    double startValue;
    double endValue;

    /// Determine the start and end values for the animation based on direction.
    if (widget.direction == PathDirection.forward) {
      startValue = 0.0;
      endValue = pathLength;
    } else {
      startValue = pathLength;
      endValue = 0.0;
    }

    if (widget.reversePath) {
      _animation = Tween<double>(
        begin: startValue,
        end: endValue,
      ).animate(_controller);
    } else {
      _animation = Tween<double>(
        begin: endValue,
        end: startValue,
      ).animate(_controller);
    }

    /// Add a listener to the animation controller to handle animation status.
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.reversePath) {
          _controller.reverse(); /// Reverse the animation if reversePath is true.
        } else {
          _controller.reset();
          _controller.forward();
        }
      } else if (status == AnimationStatus.dismissed && widget.reversePath) {
        _controller.forward();
      }
    });

    /// Start the animation.
    _controller.forward();
  }

  @override
  void dispose() {
    /// Dispose of the animation controller when the widget is removed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final pathMetric = widget.path.computeMetrics().single;
        final currentPosition = pathMetric.getTangentForOffset(_animation.value)!.position;
        /// Translate the child widget along the path using the current position.
        return Transform.translate(
          offset: Offset(currentPosition.dx, currentPosition.dy),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}