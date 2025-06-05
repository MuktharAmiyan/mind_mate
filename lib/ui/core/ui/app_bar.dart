import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, super.title, super.actions, Widget? leading})
    : super(
        centerTitle: true,
        leadingWidth: kToolbarHeight + Dimens.smallPadding,
        leading: leading != null
            ? Padding(
                padding: EdgeInsetsGeometry.only(left: Dimens.smallPadding),
                child: leading,
              )
            : null,
      );
}
