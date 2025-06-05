import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/utils/assets.dart';

class FocusAreaView extends StatelessWidget {
  const FocusAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          iconPath: Assets.mental,
          label: 'Mental Energy',
          color: AppColors.lightGreen,
          onTap: () {},
          context: context,
        ),
        _buildDivider(),
        _buildButton(
          iconPath: Assets.emotinal,
          label: 'Emotinal Balance',
          color: AppColors.lightPurple,
          onTap: () {},
          context: context,
        ),
        _buildDivider(),
        _buildButton(
          iconPath: Assets.creative,
          label: 'Creative Flow',
          color: AppColors.lightBlue,
          onTap: () {},
          context: context,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String iconPath,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required BuildContext context,
  }) => InkWell(
    onTap: onTap,
    borderRadius: Dimens.containerRadius,
    child: Padding(
      padding: Dimens.of(context).edgeInsetsScreenSymmetric,
      child: Column(
        spacing: Dimens.smallPadding,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: color,
            child: SvgPicture.asset(iconPath, width: 35),
          ),
          SizedBox(
            width: 70,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _buildDivider() => SizedBox(height: 70, child: VerticalDivider());
}
