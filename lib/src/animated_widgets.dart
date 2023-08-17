import 'package:flutter/material.dart';

class AnimatedWidgets extends StatefulWidget {
  const AnimatedWidgets({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<AnimatedWidgets> createState() => _AnimatedWidgetsState();
}

class _AnimatedWidgetsState extends State<AnimatedWidgets> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment:
          selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: widget.child,
        ),
      ),
    );
  }
}

class EaseInAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

   const EaseInAnimationWidget({super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<EaseInAnimationWidget> createState() => _EaseInAnimationWidgetState();
}

class _EaseInAnimationWidgetState extends State<EaseInAnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}

class SlideInAnimationWidget extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Duration duration;

  const SlideInAnimationWidget({super.key,
    required this.child,
    this.beginOffset = const Offset(0.0, 1.0),
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<SlideInAnimationWidget> createState() => _SlideInAnimationWidgetState();
}

class _SlideInAnimationWidgetState extends State<SlideInAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class RotationAnimationWidget extends StatefulWidget {
  final Widget child;
  final double beginRotation;
  final Duration duration;

  const RotationAnimationWidget({super.key,
    required this.child,
    this.beginRotation = 0.0,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<RotationAnimationWidget> createState() => _RotationAnimationWidgetState();
}

class _RotationAnimationWidgetState extends State<RotationAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: widget.beginRotation,
      end: 360.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}

class BounceAnimationWidget extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final Duration duration;

  const BounceAnimationWidget({super.key,
    required this.child,
    this.beginScale = 0.5,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<BounceAnimationWidget> createState() => _BounceAnimationWidgetState();
}

class _BounceAnimationWidgetState extends State<BounceAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: widget.beginScale,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

class ShakeAnimationWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ShakeAnimationWidget({super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<ShakeAnimationWidget> createState() => _ShakeAnimationWidgetState();
}

class _ShakeAnimationWidgetState extends State<ShakeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0.1, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}

class PulseAnimation extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final Duration duration;

  const PulseAnimation({super.key,
    required this.child,
    this.beginScale = 1.0,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<PulseAnimation> createState() => _PulseAnimationState();
}

class _PulseAnimationState extends State<PulseAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: widget.beginScale,
      end: widget.beginScale * 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}

class FlipAnimation extends StatefulWidget {
  final Widget frontChild;
  final Widget backChild;
  final bool isFlipped;
  final Duration duration;

  const FlipAnimation({
    required this.frontChild,
    required this.backChild,
    this.isFlipped = false,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _FlipAnimationState createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  void _toggleFlip() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.isFlipped) {
      _controller.value = 1.0;
    }
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        if (!_isFlipped) {
          _toggleFlip();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isFlipped) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Adjust the perspective
              ..rotateY((1 - _animation.value) * -3.14159265359), // Half π
            alignment: Alignment.center,
            child: _animation.value >= 0.5
                ? widget.backChild
                : widget.frontChild,
          );
        },
      ),
    );
  }
}

class PathAnimation extends StatefulWidget {
  final Widget child;
  final Path path;
  final Duration duration;

  const PathAnimation({super.key,
    required this.child,
    required this.path,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<PathAnimation> createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 1.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final dx = widget.path.getBounds().width * _animation.value.dx;
        final dy = widget.path.getBounds().height * _animation.value.dy;
        return Transform.translate(
          offset: Offset(dx, dy),
          child: widget.child,
        );
      },
    );
  }
}
class ColorChangeAnimation extends StatefulWidget {
  final Widget child;
  final Color beginColor;
  final Duration duration;

  const ColorChangeAnimation({
    required this.child,
    this.beginColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _ColorChangeAnimationState createState() => _ColorChangeAnimationState();
}

class _ColorChangeAnimationState extends State<ColorChangeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.beginColor;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = ColorTween(
      begin: widget.beginColor,
      end: Colors.blue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start the animation immediately after initialization
    // _controller.forward();

    // _animation.addListener(() {
    //   setState(() {
    //     currentColor = _animation.value!;
    //   });
    // });
    _controller.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
          currentColor = _animation.value!;
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
          currentColor = _animation.value!;
        }
      });
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 150,
          height: 150,
          color: currentColor,
          child: widget.child,
        );
      },
    );
  }
}
class EaseOutBounceAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const EaseOutBounceAnimation({
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _EaseOutBounceAnimationState createState() => _EaseOutBounceAnimationState();
}

class _EaseOutBounceAnimationState extends State<EaseOutBounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: 0.0,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + _animation.value * 0.3, // Adjust the scale factor
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}