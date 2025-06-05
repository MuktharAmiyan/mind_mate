import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';

class AppSurfaceContainerButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget label;
  final Widget? icon;

  const AppSurfaceContainerButton({
    super.key,
    required this.onTap,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.surfaceContainerColor,
        foregroundColor: Colors.black,
        iconColor: AppColors.purple,
        textStyle: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      onPressed: () {},
      label: label,
      icon: icon,
      iconAlignment: IconAlignment.end,
    );
  }
}
