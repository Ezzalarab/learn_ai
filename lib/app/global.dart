import 'exports.dart';

class Global {
  static late LocalStorage localStorage;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    localStorage = await LocalStorage().init();
  }
}
