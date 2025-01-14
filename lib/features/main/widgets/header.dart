import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import 'route_title.dart';
import 'theme_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            color: Colors.black,
            child: const Image(image: AssetImage(AppAssets.signature)),
          ),
          const Expanded(
            child: Stack(
              children: [
                Align(
                  child: RouteTitle(
                    textStyle: TextStyle(fontSize: 28),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ThemeButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
