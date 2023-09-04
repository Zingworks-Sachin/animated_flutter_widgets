import 'dart:ui';
import 'package:animated_flutter_widgets/enums/enums.dart';
import 'package:flutter/material.dart';

class AnimatedListViewBuilder extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final CollectionAnimationType animationType;
  final Duration? animationDuration;
  final double itemDelay;
  final Color? customColor;
  final double? bounceAmplitude;
  final Axis? scrollDirection;
  final ScrollController? controller;
  final bool? reverse;
  final bool? primary;
  final bool? shrinkWrap;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;

  const AnimatedListViewBuilder({super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.animationType = CollectionAnimationType.fadeOut,
    this.animationDuration = const Duration(milliseconds: 500),
    this.itemDelay = 0.1,
    this.bounceAmplitude,
    this.customColor, this.scrollDirection, this.controller, this.reverse, this.primary, this.shrinkWrap, this.physics, this.padding, // Add custom color parameter for colorChange
  });

  @override
  State<AnimatedListViewBuilder> createState() =>
      _AnimatedListViewBuilderState();
}

class _AnimatedListViewBuilderState extends State<AnimatedListViewBuilder>
    with TickerProviderStateMixin {
  List<bool> _isVisibleList = [];
  late AnimationController _stepAnimationController;
  late AnimationController _leftRightScaleAnimationController;
  late AnimationController _scaleAndFadeAnimationController;
  late AnimationController _slideAndBounceAnimationController;
  late AnimationController? _scaleLoadAnimationController;

  double screenWidth = 0.0;

  double screenHeight = 0.0;

  var startAnimation = false;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
    _isVisibleList = List.generate(widget.itemCount, (index) => false);
    _stepAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _leftRightScaleAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleAndFadeAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _slideAndBounceAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _scaleLoadAnimationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _startAnimations();
  }

  @override
  void dispose() {
    // Dispose of animation controllers to prevent memory leaks
    _stepAnimationController.dispose();
    _leftRightScaleAnimationController.dispose();
    _scaleAndFadeAnimationController.dispose();
    _slideAndBounceAnimationController.dispose();
    _scaleLoadAnimationController?.dispose();
    _scaleLoadAnimationController = null;
    super.dispose();
  }

  void _startAnimations() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        for (int i = 0; i < widget.itemCount; i++) {
          Future.delayed(
            Duration(milliseconds: (i * widget.itemDelay * 1000).toInt()),
                () {
              if (mounted) {
                setState(() {
                  _isVisibleList[i] = true;
                });
              }
            },
          );
        }
      }
    });
  }

  Widget _buildColorChangeAnimation(BuildContext context, int index) {
    final color = widget.customColor ?? Colors.transparent;
    return AnimatedContainer(
      duration: widget.animationDuration ?? const Duration(milliseconds: 500),
      color: _isVisibleList[index] ? color : Colors.transparent,
      child: widget.itemBuilder(context, index),
    );
  }

  Widget _buildScaleAndFadeAnimation(BuildContext context, int index) {
    final double start = _isVisibleList[index] ? 1.0 : 0.0;
    final double end = _isVisibleList[index] ? 0.0 : 1.0;

    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: _scaleAndFadeAnimationController..forward(),
        curve: Curves.easeInOut,
      ),
      builder: (context, child) {
        final double? value = lerpDouble(start, end,
            CurvedAnimation(
              parent: (_scaleAndFadeAnimationController..reverse()),
              curve: Curves.easeInOut,
            ).value);

        return Transform.scale(
          scale: value,
          child: AnimatedOpacity(
            opacity: value ?? 0,
            duration: widget.animationDuration ?? const Duration(milliseconds: 500),
            child: child,
          ),
        );
      },
      child: widget.itemBuilder(context, index),
    );
  }

  Widget _buildSlideAndBounceAnimation(BuildContext context, int index) {
    final double start = _isVisibleList[index] ? -1.0 : 0.0;
    final double end = _isVisibleList[index] ? 0.0 : 1.0;

    return AnimatedBuilder(
      animation: CurvedAnimation(
        parent: (_slideAndBounceAnimationController..forward()),
        curve: Curves.bounceOut, // Use a bounce easing curve
      ),
      builder: (context, child) {
        final double? value = lerpDouble(start, end,
            CurvedAnimation(
              parent: (_slideAndBounceAnimationController..forward()),
              curve: Curves.easeInOut,
            ).value);

        // Use the user-defined bounce amplitude
        final double translationY = value! * (widget.bounceAmplitude ?? 5);

        return Transform.translate(
          offset: Offset(0.0, translationY),
          child: child,
        );
      },
      child: widget.itemBuilder(context, index),
    );
  }

  Widget _buildStepAnimation(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _stepAnimationController,
      builder: (context, child) {
        return Visibility(
          visible: _isVisibleList[index],
          maintainState: false, // You can adjust this as per your needs
          maintainAnimation: false,
          child: AnimatedContainer(
            duration: widget.animationDuration ?? const Duration(milliseconds: 500),
            constraints: _isVisibleList[index]
                ? const BoxConstraints(minHeight: 0.0, maxHeight: double.infinity)
                : const BoxConstraints(minHeight: 0.0, maxHeight: 0),
            child: widget.itemBuilder(context, index),
          ),
        );
      },
    );
  }

  Widget _buildLeftAndRightScaleAnimation(BuildContext context, int index, CollectionAnimationType listItemAnimationType, ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final startAnimation = _isVisibleList[index];
    Tween(
      begin:  1.0,
      end: 0.0,
    ).animate(_leftRightScaleAnimationController);

    _leftRightScaleAnimationController.forward();

    // Adjust the x-coordinate of the translation for left-to-right animation
    final translationX = startAnimation ? 0 : -screenWidth;

    return AnimatedBuilder(
      animation: _leftRightScaleAnimationController,
      builder: (context, child) {
        return AnimatedContainer(
          // height: 55,
          width: screenWidth,
          curve: Curves.easeInOut,
          duration: widget.animationDuration ?? Duration(milliseconds: 200 + (index * 200)),
          transform: (listItemAnimationType == CollectionAnimationType.rightScale)?
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0)
              :Matrix4.translationValues(translationX.toDouble(), 0, 0), // Updated translation
          margin: const EdgeInsets.only(
            bottom: 12,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        );
      },
      child: widget.itemBuilder(context, index),
    );
  }
  Widget _buildScaleLoadAnimation(BuildContext context, int index, Duration? animationDuration,) {
    if (_scaleLoadAnimationController != null){
      Future.delayed(Duration(milliseconds: index * 1000), () {
        _scaleLoadAnimationController?.forward();
      });
    }
    return ScaleTransition(
      scale: _scaleLoadAnimationController!.drive(
        CurveTween(curve: Curves.easeInOut),
      ),
      child: FadeTransition(
        opacity: _scaleLoadAnimationController!.drive(
          CurveTween(curve: Curves.easeInOut),
        ),
        child: widget.itemBuilder(context, index), // Replace with your grid item widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    switch (widget.animationType) {
      case CollectionAnimationType.listColored:
        return _buildListView(itemBuilder: (context, index) =>
            _buildColorChangeAnimation(context, index));
      case CollectionAnimationType.waterFall:
        return _buildListView(itemBuilder: (context, index) =>
            _buildStepAnimation(context, index));
      case CollectionAnimationType.bounce:
        return _buildListView(itemBuilder: (context, index) =>
            _buildSlideAndBounceAnimation(context, index));
      case CollectionAnimationType.fadeOut:
        return _buildListView(itemBuilder: (context, index) =>
            _buildScaleAndFadeAnimation(context, index));
      case CollectionAnimationType.leftScale:
        return _buildListView(itemBuilder: (context, index) =>
            _buildLeftAndRightScaleAnimation(context, index,CollectionAnimationType.leftScale));
      case CollectionAnimationType.rightScale:
        return _buildListView(itemBuilder: (context, index) =>
            _buildLeftAndRightScaleAnimation(context, index,CollectionAnimationType.rightScale));
      case CollectionAnimationType.scaleOut:
        return _buildListView(itemBuilder: (context, index) =>
            _buildScaleLoadAnimation(context, index,widget.animationDuration));
      default:
        return _buildListView(itemBuilder: (context, index) =>
            _buildScaleAndFadeAnimation(context, index));
    }
  }
  Widget _buildListView({required Widget? Function(BuildContext context, int index) itemBuilder}){
    return ListView.builder(
        itemCount: widget.itemCount,
        padding: widget.padding,
        physics: widget.physics,
        shrinkWrap: widget.shrinkWrap ?? false,
        primary: widget.primary,
        scrollDirection: widget.scrollDirection ?? Axis.vertical,
        itemBuilder: itemBuilder
    );
  }
}