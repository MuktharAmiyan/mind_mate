import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_mate/ui/core/themes/dimens.dart';
import 'package:mind_mate/ui/core/ui/app_bar.dart';
import 'package:mind_mate/ui/core/ui/outline_icon_button.dart';
import 'package:mind_mate/ui/discover/widgets/focus_area_view.dart';
import 'package:mind_mate/ui/discover/widgets/mental_energy_graph.dart';
import 'package:mind_mate/utils/assets.dart';

import '../widgets/profile_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppOutlineIconButton(onTap: () {}, child: Icon(Icons.more_horiz)),
            AppOutlineIconButton(
              onTap: () {},
              child: SvgPicture.asset(Assets.notification),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: Dimens.of(context).edgeInsetsScreenHorizontal,
        children: [ProfileView(), FocusAreaView(), MentalEnergyGraphView()],
      ),
    );
  }
}
