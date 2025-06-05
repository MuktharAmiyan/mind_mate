import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CircleAvatar(radius: 65, backgroundColor: Colors.amber),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.lightPurple,
                    child: RichText(
                      text: TextSpan(text: '78', children: [TextSpan()]),
                    ),
                  ),
                  Positioned.fill(
                    child: CircularProgressIndicator(
                      color: AppColors.purple,
                      value: 78 / 100,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
