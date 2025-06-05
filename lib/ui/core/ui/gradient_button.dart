import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';

class AppGradientButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final BoxShape? shape;
  const AppGradientButton({
    super.key,
    required this.onTap,
    required this.child,
    this.shape,
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
            height: 70,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: AppColors.containerGradientColors,
              ),
              borderRadius: shape == null ? radiusGeometry : null,
              shape: shape ?? BoxShape.rectangle,
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
