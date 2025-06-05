import 'package:go_router/go_router.dart';
import 'package:mind_mate/routing/routes.dart';
import 'package:mind_mate/ui/landing/screen/landing_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.landing,
  routes: [
    GoRoute(path: Routes.landing, builder: (context, state) => LandingScreen()),
  ],
);
