import 'package:go_router/go_router.dart';

import 'package:my_blocs/ui/pages/pages.dart';

class AppRoutes {
  AppRoutes._();
  static const String homePage = 'HomePage';

  static final GoRouter appRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: homePage,
      builder: (context, state) => const HomePage(),
    ),
  ]);
}
