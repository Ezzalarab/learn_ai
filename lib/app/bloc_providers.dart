import 'exports.dart';

class AppBlocProviders {
  static get appBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => SignUpBloc())
      ];
}
