import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';

class ProgressCircleView extends StatelessWidget {
  //Value should be between 0.0 - 1.0
  final double value;
  const ProgressCircleView(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: AppColors.lightPurple,
          child: RichText(
            text: TextSpan(
              text: '${(value * 100).toInt()}',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: '%',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.purple,
            value: value,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
