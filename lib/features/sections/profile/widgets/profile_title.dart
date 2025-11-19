import 'package:flutter/material.dart';

class ProfileTitle extends StatelessWidget {
  const ProfileTitle(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: .bold),
    );
  }
}
