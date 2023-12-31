import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:moneyty/src/values/string.dart';

class EmailInputField extends StatelessWidget with CommonWidgets {
  final TextEditingController controller;

  const EmailInputField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.instance.emailInputFieldHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        verticalSpace(height: 8),
        TextFormField(
          controller: controller,
          validator: (value) {
            if ((value == null || value.isEmpty) ||
                !EmailValidator.validate(value)) {
              return AppStrings.instance.emailInputFieldValidationText;
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
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.instance.red,
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            hintText: AppStrings.instance.emailInputFieldHint,
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
