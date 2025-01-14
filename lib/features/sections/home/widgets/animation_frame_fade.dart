import 'package:flutter/material.dart';

class AnimationFrameFade extends StatefulWidget {
  const AnimationFrameFade({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<StatefulWidget> createState() => _AnimationFrameFadeState();
}

class _AnimationFrameFadeState extends State<AnimationFrameFade>
    with SingleTickerProviderStateMixin {
  static final _tweenFadeIn = Tween<double>(begin: 0.0, end: 1.0);

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = _tweenFadeIn.animate(
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
          child: widget.child,
        );
      },
    );
  }
}
