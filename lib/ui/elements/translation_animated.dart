import 'package:animated_widgets/core/chain_tweens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TranslationAnimatedWidget extends StatefulWidget {
  final List<Offset> _values;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final Widget child;

  /// An translation animation using 2 values : enabled - disabled
  ///
  /// duration : the duration of the animation, including intermediate values
  /// delay : the delay before the animation starts
  /// enabled : determine if the animation is stopped or fired
  /// curve : An easing curve, see [Curve]
  ///
  /// translationDisabled : the default value of the widget
  /// translationEnabled : the animated value of the widget
  ///
  /// animationFinished : a callback called when the animation is finished
  TranslationAnimatedWidget.tween({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = const Duration(),
    Offset translationDisabled = const Offset(0, 200),
    Offset translationEnabled = const Offset(0, 0),
    Curve curve = Curves.linear,
    @required Widget child,
  }) : this(
          duration: duration,
          curve: curve,
          delay: delay,
          child: child,
          values: [translationDisabled, translationEnabled],
        );

  /// An translation animation using 2-* values
  ///
  /// duration : the duration of the animation, including intermediate values
  /// delay : the delay before the animation starts
  /// enabled : determine if the animation is stopped or fired
  /// curve : An easing curve, see [Curve]
  ///
  /// values : list of [Offset] used for the animation,
  ///   - the first : will be the translationDisabled value
  ///   - intermediate values : intermediate values between translationDisabled & translationEnabled
  ///   - the last : will be the translationEnabled value
  ///
  /// animationFinished : a callback called when the animation is finished
  TranslationAnimatedWidget({
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(),
    List<Offset> values = const [const Offset(0, 0), const Offset(0, 200)],
    this.curve = Curves.linear,
    @required this.child,
  })  : this._values = values,
        assert(values.length > 1);

  List<Offset> get values => _values;

  @override
  createState() => _State();

  //except the boolean `enabled`
  bool isAnimationEqual(TranslationAnimatedWidget other) =>
      listEquals(values, other.values) &&
      duration == other.duration &&
      curve == other.curve &&
      delay == other.delay;
}

class _State extends State<TranslationAnimatedWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _translationXAnim;
  Animation<double> _translationYAnim;

  @override
  void didUpdateWidget(TranslationAnimatedWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _createAnimations();
    _updateAnimationState();
  }

  void _updateAnimationState() async {
    await Future.delayed(widget.delay);
    _animationController.forward();
  }

  void _createAnimations() {
    _animationController?.dispose();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _translationXAnim = chainTweens(
      widget.values.map((it) => it.dx).toList(),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: widget.curve),
    )..addListener(() {
        setState(() {});
      });

    _translationYAnim = chainTweens(
      widget.values.map((it) => it.dy).toList(),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: widget.curve),
    )..addListener(() {
        setState(() {});
      });

    _updateAnimationState();
  }

  @override
  void initState() {
    _createAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_translationXAnim.value, _translationYAnim.value),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}