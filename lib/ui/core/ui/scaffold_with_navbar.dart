import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_mate/routing/routes.dart';
import 'package:mind_mate/ui/core/themes/colors.dart';
import 'package:mind_mate/utils/assets.dart';

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({required this.child, super.key});

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _calculateSelectedIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 0),
          NavigationBar(
            backgroundColor: AppColors.surfaceContainerColor,
            indicatorColor: Colors.transparent,
            height: 60,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorShape: CircleBorder(),
            destinations: [
              for (
                int index = 0;
                index < Routes.navigationbarItems.length;
                index++
              )
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: selectedIndex == index
                        ? LinearGradient(
                            colors: AppColors.containerGradientColors,
                          )
                        : null,
                  ),
                  child: NavigationDestination(
                    label: Routes.navigationbarItems[index]
                        .replaceAll('/', '')
                        .toUpperCase(),
                    icon: SvgPicture.asset(
                      switch (Routes.navigationbarItems[index]) {
                        Routes.home => Assets.home,
                        Routes.today => Assets.flower,
                        Routes.award => Assets.trophy,
                        Routes.music => Assets.music,
                        _ => Assets.elipsList,
                      },
                      width: 35,
                    ),
                  ),
                ),
            ],

            selectedIndex: selectedIndex,
            onDestinationSelected: (int idx) => _onItemTapped(idx, context),
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    return Routes.navigationbarItems.indexWhere((e) => location.startsWith(e));
  }

  void _onItemTapped(int index, BuildContext context) {
    GoRouter.of(context).go(Routes.navigationbarItems[index]);
  }
}
