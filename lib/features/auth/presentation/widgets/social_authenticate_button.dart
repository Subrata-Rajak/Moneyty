import 'package:flutter/material.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/src/values/color.dart';

class SocialAuthenticateButton extends StatelessWidget with CommonWidgets {
  final Size size;
  final String instruction;
  final String logoPath;

  const SocialAuthenticateButton({
    required this.instruction,
    required this.logoPath,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.instance.white,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            side: BorderSide(color: AppColors.instance.black),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                logoPath,
              ),
            ),
            horizontalSpace(width: 10),
            Text(
              instruction,
              style: TextStyle(
                color: AppColors.instance.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
