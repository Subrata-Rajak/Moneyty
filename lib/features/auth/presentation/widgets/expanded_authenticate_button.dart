import 'package:flutter/material.dart';
import 'package:moneyty/src/values/color.dart';

class ExpandedAuthenticateButton extends StatelessWidget {
  final String instruction;
  final Size size;
  final void Function()? onPressed;

  const ExpandedAuthenticateButton({
    required this.instruction,
    required this.size,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.instance.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          instruction,
          style: TextStyle(
            color: AppColors.instance.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
