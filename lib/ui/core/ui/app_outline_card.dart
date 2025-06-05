import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';

class AppOutlineCard extends StatelessWidget {
  final Widget child;
  const AppOutlineCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.surfaceContainerColor),
        borderRadius: Dimens.containerRadius,
      ),
      child: child,
    );
  }
}
