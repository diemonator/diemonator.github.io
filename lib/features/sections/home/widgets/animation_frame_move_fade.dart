import 'package:flutter/material.dart';

class AnimationFrameMoveFade extends StatefulWidget {
  const AnimationFrameMoveFade(
    this._tweenMoveIn,
    this._tweenFadeIn, {
    required this.child,
    super.key,
  });

  final Tween<double> _tweenFadeIn;
  final Tween<Offset> _tweenMoveIn;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AnimationFrameMoveFadeState();
}

class _AnimationFrameMoveFadeState extends State<AnimationFrameMoveFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = widget._tweenFadeIn.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _positionAnimation = widget._tweenMoveIn.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: FractionalTranslation(
            translation: _positionAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
