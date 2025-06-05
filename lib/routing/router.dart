import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mind_mate/routing/routes.dart';
import 'package:mind_mate/ui/core/ui/scaffold_with_navbar.dart';
import 'package:mind_mate/ui/daily_reflection/screen/daily_reflection_screen.dart';
import 'package:mind_mate/ui/daily_reflection/viewmodel/daily_reflection.dart';
import 'package:mind_mate/ui/discover/screen/discover_screen.dart';
import 'package:mind_mate/ui/landing/screen/landing_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.dailyReflection,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: Routes.landing, builder: (context, state) => LandingScreen()),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: <RouteBase>[
        //TODO Add Home Screen
        GoRoute(
          path: Routes.home,
          builder: (BuildContext context, GoRouterState state) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Routes.home),
                    //For sample purpose only
                    TextButton.icon(
                      iconAlignment: IconAlignment.end,
                      onPressed: () => context.push(Routes.dailyReflection),
                      label: Text('Go to Daily Reflection Screen'),
                      icon: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        //TODO Add Today Screen
        GoRoute(
          path: Routes.today,
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(body: Center(child: Text(Routes.today)));
          },
        ),
        //TODO Add Award Screen
        GoRoute(
          path: Routes.award,
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(body: Center(child: Text(Routes.award)));
          },
        ),
        //TODO Add Music Screen
        GoRoute(
          path: Routes.music,
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(body: Center(child: Text(Routes.music)));
          },
        ),
        GoRoute(
          path: Routes.discover,
          builder: (BuildContext context, GoRouterState state) {
            return const DiscoverScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: Routes.dailyReflection,
      builder: (context, state) {
        final viewModel = DailyReflectionViewModel();
        return DailyReflectionScreen(viewModel: viewModel);
      },
    ),
  ],
);
