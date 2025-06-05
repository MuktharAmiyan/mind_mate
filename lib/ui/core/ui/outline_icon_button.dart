import 'package:flutter/material.dart';

class AppOutlineIconButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  const AppOutlineIconButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey.shade200),
        padding: EdgeInsets.all(12),
      ),
      onPressed: onTap,
      icon: child,
    );
  }
}
