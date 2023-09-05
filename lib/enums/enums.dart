/// Enumeration representing directions.
enum Direction {
  left,   /// Left direction.
  right,  /// Right direction.
  up,     /// Up direction.
  down,   /// Down direction.
}

/// Enumeration representing path directions.
enum PathDirection {
  forward,  /// Forward path direction.
  reverse,  /// Reverse path direction.
}

/// Enumeration representing different types of scroll widget animations.
enum ScrollWidgetAnimationType {
  listColored,  /// List Colored animation type.
  waterFall,    /// Waterfall animation type.
  fadeOut,      /// Fade Out animation type.
  bounce,       /// Bounce animation type.
  leftScale,    /// Left Scale animation type.
  rightScale,   /// Right Scale animation type.
  scaleOut,     /// Scale Out animation type.
}

/// Enumeration representing different types of app bar animations.
enum AppBarAnimationType {
  fadeIn,    /// Fade In app bar animation.
  slideIn,   /// Slide In app bar animation.
}