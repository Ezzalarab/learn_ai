import 'app/exports.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Learn AI',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              )),
          initialRoute: WelcomePage.routeName,
          routes: {
            WelcomePage.routeName: (context) => const WelcomePage(),
            HomePage.routeName: (context) => const HomePage(),
            SignInPage.routeName: (context) => const SignInPage(),
          },
        ),
      ),
    );
  }
}
