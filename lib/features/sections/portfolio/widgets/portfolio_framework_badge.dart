import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PortfolioFrameworkBadge extends StatelessWidget {
  const PortfolioFrameworkBadge(
    this._icon,
    this._label, {
    this.onTap,
    super.key,
  });

  final IconData _icon;
  final String _label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).focusColor,
            ),
            child: Icon(
              _icon,
              size: 100,
              color: Colors.blue,
            ),
          ),
          const Gap(16),
          SelectableText(_label),
        ],
      ),
    );
  }
}
