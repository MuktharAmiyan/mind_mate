import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_mate/utils/assets.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.appLogo);
  }
}
