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
      page: const AppPage(),
      bloc: BlocProvider(create: (_) => AppBloc()),
    ),
    PageEntity(
      route: AppRoutes.application,
      page: const HomePage(),
      bloc: BlocProvider(create: (_) => HomePageBloc()),
    ),
    PageEntity(
      route: AppRoutes.settings,
      page: const SettingsPage(),
      bloc: BlocProvider(create: (_) => SettingsBloc()),
    ),
  ];

  static List<dynamic> allBlocProviders(BuildContext context) =>
      routes.map((route) => route.bloc).toList();

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      bool hasSeenOnBoarding =
          Global.localStorage.getBoolData(SharedPrefsKeys.hasSeenOnBoarding) ??
              false;
      if (settings.name == AppRoutes.initial) {
        if (hasSeenOnBoarding) {
          String? userToken = Global.localStorage
              .getStringData(SharedPrefsKeys.userAccessTokenKey);
          if (FirebaseAuth.instance.currentUser == null ||
              userToken == null ||
              userToken == '') {
            return MaterialPageRoute(
              builder: (_) => routes
                  .firstWhere((route) => route.route == AppRoutes.signIn)
                  .page,
              settings: settings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => routes
                  .firstWhere((route) => route.route == AppRoutes.application)
                  .page,
              settings: settings,
            );
          }
        }
      }
      return MaterialPageRoute(
        builder: (_) =>
            routes.firstWhere((route) => route.route == settings.name).page,
        settings: settings,
      );
    } else {
      if (kDebugMode) {
        print('null route name');
      }
      return MaterialPageRoute(
        builder: (_) =>
            routes.firstWhere((route) => route.route == AppRoutes.initial).page,
        settings: settings,
      );
    }
  }
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
