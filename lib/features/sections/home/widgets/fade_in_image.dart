import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class FadeInImageWithTicker extends StatefulWidget {
  const FadeInImageWithTicker({super.key});

  @override
  State<FadeInImageWithTicker> createState() => _FadeInImageWithTickerState();
}

class _FadeInImageWithTickerState extends State<FadeInImageWithTicker>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
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
    return FadeTransition(
      opacity: _opacityAnimation,
      child: const Image(
        image: AssetImage(AppAssets.cover),
        width: 300,
        height: 300,
        fit: .cover,
      ),
    );
  }
}
