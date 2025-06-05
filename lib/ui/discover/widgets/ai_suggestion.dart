import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/gradient_button.dart';
import 'package:mind_mate/utils/assets.dart';

class AiSuggestionView extends StatelessWidget {
  const AiSuggestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimens.of(context).edgeInsetsScreenVerticall,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AI Suggestion',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              // ignore: deprecated_member_use
              SvgPicture.asset(Assets.arrowRight, color: AppColors.green),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(top: Dimens.smallPadding),
            child: Column(
              children: [
                ...[
                  (
                    label: 'Short Meditation',
                    icon: Assets.mediation,
                    time: 5,
                    exercise: 3,
                    value: '+20',
                  ),
                  (
                    label: 'Short Meditation',
                    icon: Assets.mediation,
                    time: 7,
                    exercise: 4,
                    value: '+30',
                  ),
                ].map(
                  (e) => SizedBox(
                    width: double.infinity,
                    child: AppGradientButton(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: Dimens.smallGap,
                            children: [
                              Container(
                                padding: EdgeInsets.all(Dimens.smallPadding),

                                decoration: BoxDecoration(
                                  color: AppColors.lightGreen,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SvgPicture.asset(e.icon, width: 35),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.label,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    spacing: Dimens.smallGap * 2,
                                    children: [
                                      _buildValueLabel(e.time, 'min', context),
                                      _buildValueLabel(
                                        e.exercise,
                                        'exercise',
                                        context,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(e.value),
                              SvgPicture.asset(
                                Assets.arrowDownElipsed,
                                // ignore: deprecated_member_use
                                color: AppColors.purple,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueLabel(int value, String label, BuildContext ctx) => Row(
    children: [
      Text('$value'),
      Card.filled(
        color: AppColors.surfaceContainerColor.withValues(alpha: 0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(label),
        ),
      ),
    ],
  );
}
