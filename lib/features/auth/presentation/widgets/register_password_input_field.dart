import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_bloc.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_events.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_states.dart';
import 'package:moneyty/injection_container.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:moneyty/src/values/string.dart';

class RegisterPasswordInputField extends StatelessWidget with CommonWidgets {
  final TextEditingController controller;

  const RegisterPasswordInputField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.instance.passwordInputFieldHeader,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        verticalSpace(height: 8),
        BlocProvider<RegisterScreenBloc>(
          create: (context) => sl(),
          child: BlocBuilder<RegisterScreenBloc, RegisterScreenStates>(
            builder: (context, state) {
              if (state is RegisterInitialState) {
                return buildWidget(
                  context: context,
                  isObscure: state.isObscure,
                );
              } else if (state is RegisterPasswordState) {
                return buildWidget(
                  context: context,
                  isObscure: state.isObscure,
                );
              }
              return emptyContainer();
            },
          ),
        ),
      ],
    );
  }

  buildWidget({
    required BuildContext context,
    required bool isObscure,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if ((value == null || value.isEmpty) || value.length < 6) {
          return AppStrings.instance.passwordInputFieldValidationText;
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
        hintText: AppStrings.instance.passwordInputFieldHint,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        prefixIcon: const Icon(
          FontAwesomeIcons.lock,
        ),
        suffix: GestureDetector(
          onTap: () => context
              .read<RegisterScreenBloc>()
              .add(ToggleRegisterPasswordEvent()),
          child: Icon(
            isObscure ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
          ),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
