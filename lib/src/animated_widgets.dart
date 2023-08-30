export 'package:animated_widgets/widgets/heart_widget.dart';
export 'package:animated_widgets/animations/page_transition_animation.dart';
export 'package:animated_widgets/animations/droplet_wrapper.dart';
export 'package:animated_widgets/animations/shimmer_animations.dart';
export 'package:animated_widgets/animations/image_color_change_animation.dart';
export 'package:animated_widgets/animated_widgets/appbars/fade_in_appbar.dart';
export 'package:animated_widgets/animated_widgets/appbars/slide_in_appbar.dart';
export 'package:animated_widgets/animated_widgets/appbars/color_animated_appbar.dart';
export 'package:animated_widgets/widgets/water_droplet.dart';
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


class SlideOutAnimationWidget extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Duration duration;

  const SlideOutAnimationWidget({super.key,
    required this.child,
    this.beginOffset = const Offset(0.0, 1.0),
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<SlideOutAnimationWidget> createState() => _SlideOutAnimationWidgetState();
}
class _SlideOutAnimationWidgetState extends State<SlideOutAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: widget.duration,
    // );
    // _animation = Tween<Offset>(
    //   begin: widget.beginOffset,
    //   end: Offset.zero,
    // ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    // _controller.forward();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: widget.beginOffset,
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

// class SlideOutAnimationWidget extends StatefulWidget {
//   final Widget child;
//   final Offset endOffset;
//   final Duration duration;
//
//   const SlideOutAnimationWidget({
//     Key? key,
//     required this.child,
//     this.endOffset = const Offset(0.0, 1.0),
//     this.duration = const Duration(milliseconds: 500),
//   }) : super(key: key);
//
//   @override
//   State<SlideOutAnimationWidget> createState() =>
//       _SlideOutAnimationWidgetState();
// }
// class _SlideOutAnimationWidgetState extends State<SlideOutAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     _animation = Tween<Offset>(
//       begin: Offset.zero,
//       end: widget.endOffset,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SlideTransition(
//       position: _animation,
//       child: widget.child,
//     );
//   }
// }

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

  const FlipAnimation({super.key,
    required this.frontChild,
    required this.backChild,
    this.isFlipped = false,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
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

// class PathAnimation extends StatefulWidget {
//   final Widget child;
//   final Path path;
//   final Duration duration;
//
//   const PathAnimation({super.key,
//     required this.child,
//     required this.path,
//     this.duration = const Duration(seconds: 3),
//   });
//
//   @override
//   State<PathAnimation> createState() => _PathAnimationState();
// }
//
// class _PathAnimationState extends State<PathAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//     _animation = Tween<Offset>(
//       begin: Offset.zero,
//       end: Offset(1.0, 1.0),
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         final dx = widget.path.getBounds().width * _animation.value.dx;
//         final dy = widget.path.getBounds().height * _animation.value.dy;
//         return Transform.translate(
//           offset: Offset(dx, dy),
//           child: widget.child,
//         );
//       },
//     );
//   }
// }

// class PathAnimation extends StatefulWidget {
//   final Widget child;
//   final Path path;
//   final Duration duration;
//   final bool reversePath;
//
//   const PathAnimation({
//     required this.child,
//     required this.path,
//     this.duration = const Duration(seconds: 3),
//     this.reversePath = false,
//   });
//
//   @override
//   _PathAnimationState createState() => _PathAnimationState();
// }
//
// class _PathAnimationState extends State<PathAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: widget.duration,
//     );
//
//     final pathMetric = widget.path.computeMetrics().single;
//     final pathLength = pathMetric.length;
//
//     if (widget.reversePath) {
//       _animation = Tween<double>(
//         begin: 0.0,
//         end: pathLength,
//       ).animate(_controller);
//     } else {
//       _animation = Tween<double>(
//         begin: pathLength,
//         end: 0.0,
//       ).animate(_controller);
//     }
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         if (widget.reversePath) {
//           _controller.reverse();
//         } else {
//           _controller.reset();
//           _controller.forward();
//         }
//       } else if (status == AnimationStatus.dismissed && widget.reversePath) {
//         _controller.forward();
//       }
//     });
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         final pathMetric = widget.path.computeMetrics().single;
//         final currentPosition = pathMetric.getTangentForOffset(_animation.value)?.position;
//         return Transform.translate(
//           offset: Offset(currentPosition?.dx ?? 10, currentPosition?.dy ?? 10),
//           child: child,
//         );
//       },
//       child: widget.child,
//     );
//   }
// }

enum PathDirection {
  forward,
  reverse,
}

class PathAnimation extends StatefulWidget {
  final Widget child;
  final Path path;
  final Duration duration;
  final bool reversePath;
  final PathDirection direction;

  const PathAnimation({super.key,
    required this.child,
    required this.path,
    this.duration = const Duration(seconds: 3),
    this.reversePath = false,
    this.direction = PathDirection.forward,
  });

  @override
  _PathAnimationState createState() => _PathAnimationState();
}

class _PathAnimationState extends State<PathAnimation>
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

    final pathMetric = widget.path.computeMetrics().single;
    final pathLength = pathMetric.length;

    double startValue;
    double endValue;

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

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.reversePath) {
          _controller.reverse();
        } else {
          _controller.reset();
          _controller.forward();
        }
      } else if (status == AnimationStatus.dismissed && widget.reversePath) {
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final pathMetric = widget.path.computeMetrics().single;
        final currentPosition = pathMetric.getTangentForOffset(_animation.value)!.position;
        return Transform.translate(
          offset: Offset(currentPosition.dx, currentPosition.dy),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class ColorChangeAnimation extends StatefulWidget {
  final Widget child;
  final Color beginColor;
  final Duration duration;
  final ValueChanged<Color>? currentAnimationColor;


  const ColorChangeAnimation({super.key,
    required this.child,
    this.beginColor = Colors.transparent,
    this.duration = const Duration(milliseconds: 500), this.currentAnimationColor,
  });

  @override
  State<ColorChangeAnimation> createState() => _ColorChangeAnimationState();
}

class _ColorChangeAnimationState extends State<ColorChangeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late Color currentColor;
  ValueChanged<Color>? currentAnimationColor;

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
          // color: currentColor,
          child: widget.child,
        );
      },
    );
  }
}
class FastOutSlowInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double? scale;

  const FastOutSlowInAnimation({super.key,
    required this.child,
    this.duration = const Duration(seconds: 1), this.scale,
  });

  @override
  State<FastOutSlowInAnimation> createState() => _FastOutSlowInAnimationState();
}

class _FastOutSlowInAnimationState extends State<FastOutSlowInAnimation>
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
            scale: 1 + _animation.value * (widget.scale ??0.9), // Adjust the scale factor
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final double startScale;
  final double endScale;
  final Duration duration;

  const ScaleAnimation({super.key,
    required this.child,
    this.startScale = 1.0,
    this.endScale = 1.5,
    this.duration = const Duration(seconds: 1),
  });

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
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
      begin: widget.startScale,
      end: widget.endScale,
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
class ParallaxAnimation extends StatelessWidget {
  final double xOffset;
  final double yOffset;
  final Widget child;

  const ParallaxAnimation({super.key,
    required this.xOffset,
    required this.yOffset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(xOffset, yOffset),
      child: child,
    );
  }
}
class GestureAnimation extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onTap;

  const GestureAnimation({super.key,
    required this.child,
    required this.onTap,
  });

  @override
  _GestureAnimationState createState() => _GestureAnimationState();
}

class _GestureAnimationState extends State<GestureAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
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
        widget.onTap();
        _controller.forward();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (_controller.value * 0.2),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}