import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';

class AppGradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const AppGradientButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radiusGeometry = BorderRadius.circular(26);
    return DefaultTextStyle(
      style: Theme.of(
        context,
      ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          borderRadius: radiusGeometry,
          child: Container(
            height: 75,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.containerGradientColors,
              ),
              borderRadius: radiusGeometry,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [child],
            ),
          ),
        ),
      ),
    );
  }
}
