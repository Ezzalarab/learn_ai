import 'app/exports.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      providers: AppBlocProviders.appBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learn AI',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                // iconTheme: IconThemeData(
                //   color: AppColors.primaryText,
                // ),
                elevation: 0,
                backgroundColor: Colors.white,
              )),
          initialRoute: WelcomePage.routeName,
          routes: {
            WelcomePage.routeName: (context) => const WelcomePage(),
            HomePage.routeName: (context) => const HomePage(),
            SignInPage.routeName: (context) => const SignInPage(),
            SignUpPage.routeName: (context) => const SignUpPage(),
          },
        ),
      ),
    );
  }
}
