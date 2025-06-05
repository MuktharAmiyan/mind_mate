import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_mate/ui/core/enums/mood.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/app_bar.dart';
import 'package:mind_mate/ui/core/ui/outline_icon_button.dart';
import 'package:mind_mate/ui/daily_reflection/viewmodel/daily_reflection.dart';
import 'package:mind_mate/ui/daily_reflection/widget/mood_selector_picker.dart';
import 'package:mind_mate/utils/assets.dart';

class DailyReflectionScreen extends StatelessWidget {
  const DailyReflectionScreen({
    super.key,
    required DailyReflectionViewModel viewModel,
  }) : _viewModel = viewModel;
  final DailyReflectionViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(context),
                MoodSelectorPicker(
                  value: _viewModel.mood,
                  onChange: (value) => _viewModel.mood = value,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) => Padding(
    padding: Dimens.of(context).edgeInsetsScreenSymmetric,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Dimens.smallGap,
          children: [
            Text(
              'Daily Reflection',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'What is your mood today?',
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.lightPurple,
            padding: EdgeInsets.all(15),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(Assets.chat, width: 30),
        ),
      ],
    ),
  );

  AppBar _buildAppBar(BuildContext context) => CustomAppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppOutlineIconButton(
          onTap: context.pop,
          child: SvgPicture.asset(Assets.arrowLeft),
        ),
        Row(
          spacing: Dimens.smallGap,
          children: [
            AppOutlineIconButton(onTap: () {}, child: Icon(Icons.more_horiz)),
            AppOutlineIconButton(
              onTap: () {},
              child: SvgPicture.asset(Assets.library),
            ),
          ],
        ),
      ],
    ),
  );
}
