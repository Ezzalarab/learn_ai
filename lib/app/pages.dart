import 'exports.dart';

class AppPages {
  static List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.initial,
      page: const WelcomePage(),
      bloc: BlocProvider(create: (_) => WelcomeBloc()),
    ),
    PageEntity(
      route: AppRoutes.signIn,
      page: const SignInPage(),
      bloc: BlocProvider(create: (_) => SignInBloc()),
    ),
    PageEntity(
      route: AppRoutes.signUp,
      page: const SignUpPage(),
      bloc: BlocProvider(create: (_) => SignUpBloc()),
    ),
    PageEntity(
      route: AppRoutes.application,
      page: const WelcomePage(),
      bloc: BlocProvider(create: (_) => WelcomeBloc()),
    ),
  ];

  static List<dynamic> allBlocProviders(BuildContext context) =>
      routes.map((route) => route.bloc).toList();

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) =>
      MaterialPageRoute(
        builder: (_) =>
            routes.firstWhere((route) => route.route == settings.name).page,
        settings: settings,
      );
}

// unify bloc providers with routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
