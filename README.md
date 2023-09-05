[![pub package](https://img.shields.io/pub/v/animated_flutter_widgets.svg)](https://pub.dartlang.org/packages/animated_flutter_widgets)

<br>
<p align="center">
<img alt="animated_flutter_widgets" src="https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/plugin_image.png?raw=true" />
</p>
<br><br>

# Introduction

Elevate your Flutter app's user interface to a whole new level with [animated_flutter_widgets](https://pub.dartlang.org/packages/animated_flutter_widgets). This versatile package lets you effortlessly add mesmerizing animations to any widget while also offering a collection of pre-designed animated widgets for accelerated development.

## Supported platforms
- Android
- iOS
- Web
- MacOS
- Windows

## Features
### * Steady Animations

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/steady_animation.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Continuous Animations

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/continous_animations.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Page Transition Animations

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/page_transition_animation.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Button Tap Animations

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/button_tap_animation.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Animated ListViews

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/animated_list_view.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Animated GridViews

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/animated_grid_view.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

### * Animated AppBars

[![screen](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/assets/animated_app_bar.gif)](https://github.com/Zingworks-Sachin/animated_flutter_widgets)

## Usage
```dart
/// To use these animations(Steady, Continuous & Tap Animations) wrap your widget inside the animation widgets
SlideInAnimation(
 direction: Direction.right,
 duration: const Duration(seconds: 1),
 child: YourWidget()
);

Cube3DAnimation(
 sideLength: 100,
 duration: const Duration(seconds: 4),
 isContinuous: true,
 child: YourWidget()
);

LongTapAnimation(
// pressDuration: Duration(seconds: 0),
 child: YourWidget()
);

/// To use Animated ListView & GridView
AnimatedListViewBuilder(
 itemCount: 25, // Change this to your desired item count
 customColor: ColorUtility.magenta, // Use this if you are using CollectionAnimationType.listColored
 animationType: CollectionAnimationType.leftScale, //Change this to your desired animation type
 itemBuilder: (context, index) {
  return YourWidget()
 }
);

AnimatedGridViewBuilder(
 itemCount: 25, // Change this to your desired item count
 animationType: CollectionAnimationType.scaleOut, //Change this to your desired animation type
 itemBuilder: (context, index) {
  return YourWidget()
 }
);

/// To use Animated AppBar
SlideInAnimatedAppBar(
 backgroundColor: ColorUtility.magenta,
 animationDuration: 1000,
 title: const Text('Second Page'),
)

/// To use Page Transition Animations
Navigator.push(context,PopAndScaleTransition(page: YourPage()));
```

## Example
Check out the [example](https://github.com/Zingworks-Sachin/animated_flutter_widgets/tree/main/example)

## License
[MIT License](https://github.com/Zingworks-Sachin/animated_flutter_widgets/blob/main/LICENSE)

## Issues and feedback
If you have any suggestions for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/Zingworks-Sachin/animated_flutter_widgets/issues) or to open a [pull request](https://github.com/Zingworks-Sachin/animated_flutter_widgets/pulls), you are more than welcome to contribute!

## Contributor
- Sachin Pandit ([ZingWorks LLP](https://zingworks.in/))
