import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_them_all/presentation/splashscreen.dart';
import 'package:free_them_all/utils/theme.dart';
import 'package:get/route_manager.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Free Them ALL",
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: mainTheme,
    );
  }
}
