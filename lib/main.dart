import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneyty/core/routes/routes.dart';
import 'package:moneyty/src/themes/light.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppLightTheme.instance.getLightTheme(),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.instance.router,
    );
  }
}
