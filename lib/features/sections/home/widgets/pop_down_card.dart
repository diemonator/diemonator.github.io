import 'package:flutter/material.dart';

final _tweenFadeIn = Tween<double>(begin: 0.0, end: 1.0);
final _tweenMoveInFromBottom = Tween<Offset>(
  begin: const Offset(0, 1),
  end: Offset.zero,
);

class PopDownCard extends StatefulWidget {
  const PopDownCard({super.key});

  @override
  State<StatefulWidget> createState() => _PopDownCardState();
}

class _PopDownCardState extends State<PopDownCard>
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

    _fadeAnimation = _tweenFadeIn.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _positionAnimation = _tweenMoveInFromBottom.animate(
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
            child: const Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText('Hi, My name is Emil Karamihov'),
                    SelectableText("I'm a software engineer"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
