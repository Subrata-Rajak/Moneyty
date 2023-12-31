import 'package:flutter/material.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/core/utils/assets_paths.dart';
import 'package:moneyty/src/values/string.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:go_router/go_router.dart';

class OnboardScreen extends StatelessWidget with CommonWidgets {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImagePaths.instance.onboardingBgPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(height: 30),
              buildText(),
              verticalSpace(height: 20),
              buildSubText(),
              verticalSpace(height: 100),
              buildGigImage(),
              verticalSpace(height: 100),
              buildContinueButton(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Text buildText() {
    return Text(
      AppStrings.instance.onboardingText,
      style: TextStyle(
        color: AppColors.instance.white,
        fontSize: 34,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text buildSubText() {
    return Text(
      AppStrings.instance.onboardingSubText,
      style: TextStyle(
        color: AppColors.instance.offPurple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Image buildGigImage() {
    return Image(
      image: AssetImage(
        ImagePaths.instance.onboardingGigPath,
      ),
    );
  }

  Row buildContinueButton({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.replace(AppRoutePaths.instance.loginScreenRoutePath);
          },
          child: Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.instance.black,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Text(
                  AppStrings.instance.continueButtonText,
                  style: TextStyle(
                    color: AppColors.instance.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                horizontalSpace(width: 10),
                Image(
                  image: AssetImage(
                    ImagePaths.instance.arrowPicPath,
                  ),
                ),
              ],
            ),
          ),
        ),
        horizontalSpace(width: 50),
      ],
    );
  }
}
