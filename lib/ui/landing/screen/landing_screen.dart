import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_mate/routing/routes.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/app_bar.dart';
import 'package:mind_mate/ui/core/ui/app_logo.dart';
import 'package:mind_mate/ui/core/ui/gradient_button.dart';
import 'package:mind_mate/ui/core/ui/outline_icon_button.dart';
import 'package:mind_mate/ui/core/ui/surface_container_button.dart';
import 'package:mind_mate/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goToHomeScreen() => context.go(Routes.discover);
    return Scaffold(
      extendBody: true,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildVector(),
              Padding(
                padding: Dimens.of(context).edgeInsetsScreenHorizontal,
                child: Column(
                  spacing: Dimens.smallGap,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildTitle(context), _buildSubTitle(context)],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: Dimens.of(context).edgeInsetsScreenHorizontal,
          child: Row(
            children: [
              Expanded(
                child: AppGradientButton(
                  onTap: goToHomeScreen,
                  child: Row(
                    spacing: Dimens.smallGap,
                    children: [
                      Card.outlined(
                        color: Colors.transparent,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.chevron_right),
                        ),
                      ),
                      Text("Get Started"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [TextButton(onPressed: () {}, child: Text('Skip'))],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) => RichText(
    text: TextSpan(
      text: 'Unlock the Power of Your Mind',
      style: Theme.of(
        context,
      ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w900),
      children: [
        WidgetSpan(
          child: Wrap(
            spacing: Dimens.smallGap,
            children: [
              SizedBox(width: Dimens.smallGap),
              ...[
                Assets.brainEmoji,
                Assets.hourglassEmoji,
                Assets.smileEmoji,
              ].map(
                (e) => CircleAvatar(
                  backgroundColor: AppColors.surfaceContainerColor,
                  child: Image.asset(e, width: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildSubTitle(BuildContext context) => Text(
    'Track your focus, balance your emotions, and train your mental clarity - all in one place.',
    style: Theme.of(context).textTheme.labelLarge,
  );

  Widget _buildVector() => SizedBox(
    height: 450,
    width: 450,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.landingVector, fit: BoxFit.cover),
          ),
          Align(alignment: Alignment.topCenter, child: AppLogo()),
        ],
      ),
    ),
  );

  AppBar _buildAppBar() => CustomAppBar(
    leading: AppOutlineIconButton(
      onTap: () {},
      child: SvgPicture.asset(Assets.arrowLeft),
    ),
    title: AppSurfaceContainerButton(
      onTap: () {},
      label: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          SvgPicture.asset(Assets.star, width: 20),
          Text('Version 2.0'),
        ],
      ),
      icon: Icon(Icons.keyboard_arrow_down, color: AppColors.purple),
    ),
  );
}
