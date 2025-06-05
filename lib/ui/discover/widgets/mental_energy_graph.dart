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
          Stack(
            children: [
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
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(8.0).copyWith(bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ..._kSampleData.entries.map((e) {
                        final color = switch (e.key) {
                          'mental' => AppColors.lightGreen,
                          'emotinal' => AppColors.lightPurple,
                          'creative' => AppColors.lightBlue,
                          _ => AppColors.lightGreen,
                        };
                        final segments = e.value;

                        return Container(
                          width: double.infinity,
                          height: 20,
                          color: Colors
                              .transparent, // Keep background transparent for overlay
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final totalSegments =
                                  5; // Assuming total duration is 5
                              return Stack(
                                children: segments.map((range) {
                                  final left =
                                      (range.start / totalSegments) *
                                      constraints.maxWidth;
                                  final width =
                                      ((range.end - range.start + 1) /
                                          totalSegments) *
                                      constraints.maxWidth;
                                  return Positioned(
                                    left: left,
                                    top: 0,
                                    bottom: 0,
                                    width: width,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        );
                      }),
                      // ..._kSampleData.entries.map((e) {
                      //   final color = switch (e.key) {
                      //     'mental' => AppColors.lightGreen,
                      //     'emotinal' => AppColors.lightPurple,
                      //     'creative' => AppColors.lightBlue,
                      //     _ => AppColors.lightGreen,
                      //   };
                      //   return Container(
                      //     width: double.infinity,
                      //     height: 20,
                      //     color: color,
                      //     child: LayoutBuilder(
                      //       builder: (context, constraints) {
                      //         return Stack(children: [

                      //         ],);
                      //       },
                      //     ),
                      //   );
                      // }),
                    ],
                  ),
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
  static const Map<String, List<({int start, int end})>> _kSampleData = {
    'mental': [(start: 0, end: 1), (start: 3, end: 3)],
    'emotinal': [(start: 1, end: 2), (start: 4, end: 4)],
    'creative': [(start: 0, end: 1), (start: 3, end: 4)],
  };

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
