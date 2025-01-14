import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final _tweenFadeIn = Tween<double>(begin: 0.0, end: 1.0);
final _tweenMoveInFromTop = Tween<Offset>(
  begin: const Offset(0, -1),
  end: Offset.zero,
);

class PopUpCard extends StatefulWidget {
  const PopUpCard({
    required this.title,
    this.children,
    super.key,
  });

  final String title;
  final List<Widget>? children;

  @override
  State<StatefulWidget> createState() => _PopUpCardState();
}

class _PopUpCardState extends State<PopUpCard>
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

    _positionAnimation = _tweenMoveInFromTop.animate(
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
    final children = widget.children;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: FractionalTranslation(
            translation: _positionAnimation.value,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SelectableText(widget.title),
                    if (children != null) ...[
                      const Gap(8),
                      Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 8,
                        spacing: 8,
                        children: children,
                      ),
                    ],
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
