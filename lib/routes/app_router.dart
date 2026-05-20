import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/about/views/about_screen.dart';
import '../views/contact/views/contact_screen.dart';
import '../views/home/views/home_screen.dart';
import '../views/main_shell.dart';
import '../views/projects/views/projects_screen.dart';
import '../views/stack/views/stack_screen.dart';
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class NavKeys {
  static final home = GlobalKey<NavigatorState>();
  static final projects = GlobalKey<NavigatorState>();
  static final stack = GlobalKey<NavigatorState>();
  static final about = GlobalKey<NavigatorState>();
  static final contact = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> byIndex(int index) {
    return [home, projects, stack, about, contact][index];
  }
}

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.home,
  debugLogDiagnostics: true,
  routes: [
    // GoRoute(path: AppRoutes.splash, builder: (_, __) => const SplashPage()),

    /// ========= MAIN SHELL =========
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: NavKeys.home,
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (_, __) => const HomeScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: NavKeys.projects,
          routes: [
            GoRoute(
              path: AppRoutes.projects,
              builder: (_, __) => const ProjectsScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: NavKeys.stack,
          routes: [
            GoRoute(
              path: AppRoutes.stack,
              builder: (_, __) => const StackScreen(),
            ),
          ],
        ),

        StatefulShellBranch(
          navigatorKey: NavKeys.about,
          routes: [
            GoRoute(
              path: AppRoutes.about,
              builder: (_, __) => const AboutScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: NavKeys.contact,
          routes: [
            GoRoute(
              path: AppRoutes.contact,
              builder: (_, __) => const ContactScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
