import 'package:flutter/material.dart';

import 'app_icon.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      // height: MediaQuery.of(context).size.width * 0.08,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppIcon(
                  iconPath: 'assets/dp.png',
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppIcon(iconPath: 'assets/notifications.png'),
                AppIcon(iconPath: 'assets/clock.png')
              ],
            ),
          )
        ],
      ),
    );
  }
}
