import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/core/utils/assets_paths.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 5000),
      () {
        context.replace(AppRoutePaths.instance.onboardScreenRoutePath);
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage(ImagePaths.instance.logoWithNameLightPath),
          ),
        ),
      ),
    );
  }
}
