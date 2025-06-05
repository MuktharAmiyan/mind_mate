import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/progress_circle_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: Dimens.smallPadding,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  //Random image
                  'https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250',
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:
                  //Now Static value, will add after implementing data logic
                  ProgressCircleView(0.78),
            ),
          ],
        ),
        Text(
          'John doe',
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
