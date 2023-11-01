import 'app/exports.dart';
import 'app/pages.dart';

// ...

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(365, 800),
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
          // home: const WelcomePage(),
          onGenerateRoute: AppPages.generateRouteSettings,
          // initialRoute: AppPage.routeName,
          // routes: {
          //   AppPage.routeName: (context) => const AppPage(),
          //   WelcomePage.routeName: (context) => const WelcomePage(),
          //   HomePage.routeName: (context) => const HomePage(),
          //   SignInPage.routeName: (context) => const SignInPage(),
          //   SignUpPage.routeName: (context) => const SignUpPage(),
          // },
        ),
      ),
    );
  }
}
