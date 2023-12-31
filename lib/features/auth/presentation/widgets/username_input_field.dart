import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:moneyty/src/values/string.dart';

class UsernameInputField extends StatelessWidget with CommonWidgets {
  final TextEditingController controller;

  const UsernameInputField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.instance.usernameInputFieldHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        verticalSpace(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.instance.usernameInputFieldValidationText;
            }
            return null;
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.grey,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.red,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.black,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.black,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            hintText: AppStrings.instance.usernameInputFieldHint,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            prefixIcon: const Icon(
              FontAwesomeIcons.envelope,
            ),
          ),
        ),
      ],
    );
  }
}
