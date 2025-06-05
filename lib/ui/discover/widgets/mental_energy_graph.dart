import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/gradient_button.dart';
import 'package:mind_mate/utils/assets.dart';

class MentalEnergyGraphView extends StatelessWidget {
  const MentalEnergyGraphView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ).copyWith(bottom: 12.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerColor,
        borderRadius: Dimens.containerRadius,
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ..._kdays.map(
                (e) => Column(
                  children: [
                    SizedBox(height: 100, child: VerticalDivider()),
                    Text(e, style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static const List<String> _kdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thr',
    'Fri',
    'Sat',
    'Sun',
  ];
  Widget _buildHeader(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: Dimens.smallGap,
        children: [
          Text(
            'YOUR MENTAL ENERGY',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
              text: '72',
              style: Theme.of(context).textTheme.headlineLarge,
              children: [
                TextSpan(
                  text: '%',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ],
      ),
      AppGradientButton(
        shape: BoxShape.circle,
        child: SvgPicture.asset(Assets.mental),
        onTap: () {},
      ),
    ],
  );
}
