import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The Instagram ActionBar.
/// It shows a Instagram logo, Notifications entry and a message entry.
class ActionBar extends StatelessWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/instagram-wordmark.svg',
                semanticsLabel: 'Instagram Logo',
                height: 40,
                width: 112,
              ),
              const Row(
                children: <Widget>[
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 35,
                  ),
                  SizedBox(width: 25),
                  Icon(
                    Icons.message_outlined,
                    size: 35,
                  ),
                ],
              ),
            ],
          ),
        ),
        // Grey divider
        Divider(
          color: Colors.grey[400],
          height: 0.1,
        ),
      ],
    );
  }
}
