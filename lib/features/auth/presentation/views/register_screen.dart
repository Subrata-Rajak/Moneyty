import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/core/utils/assets_paths.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_bloc.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_events.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_states.dart';
import 'package:moneyty/features/auth/presentation/widgets/email_input_field.dart';
import 'package:moneyty/features/auth/presentation/widgets/expanded_authenticate_button.dart';
import 'package:moneyty/features/auth/presentation/widgets/register_password_input_field.dart';
import 'package:moneyty/features/auth/presentation/widgets/social_authenticate_button.dart';
import 'package:moneyty/features/auth/presentation/widgets/username_input_field.dart';
import 'package:moneyty/injection_container.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:moneyty/src/values/string.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with CommonWidgets {
  final _registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocProvider<RegisterScreenBloc>(
            create: (context) => sl(),
            child: BlocBuilder<RegisterScreenBloc, RegisterScreenStates>(
              builder: (registerContext, state) {
                if (state is RegisteringUserState) {
                  return Stack(
                    children: [
                      buildBody(
                        size: size,
                        context: registerContext,
                      ),
                      Container(
                        width: size.width,
                        height: size.height,
                        decoration: BoxDecoration(
                          color: AppColors.instance.black.withOpacity(0.4),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.instance.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Stack(
                  children: [
                    buildBody(
                      size: size,
                      context: registerContext,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  buildBody({
    required Size size,
    required BuildContext context,
  }) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 100,
            height: 100,
            image: AssetImage(
              ImagePaths.instance.logoLightPath,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              // bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.instance.registerText,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpace(height: 5),
                Text(
                  AppStrings.instance.registerSubText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpace(height: 15),
                Form(
                  key: _registerFormKey,
                  child: Column(
                    children: [
                      UsernameInputField(
                        controller: usernameController,
                      ),
                      verticalSpace(height: 5),
                      EmailInputField(
                        controller: emailController,
                      ),
                      verticalSpace(height: 5),
                      RegisterPasswordInputField(
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                verticalSpace(height: 20),
                ExpandedAuthenticateButton(
                  instruction: AppStrings.instance.registerButtonText,
                  size: size,
                  onPressed: () {
                    if (_registerFormKey.currentState!.validate()) {
                      context.read<RegisterScreenBloc>().add(
                            RegisterUserEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                ),
                verticalSpace(height: 4),
                SocialAuthenticateButton(
                  instruction:
                      AppStrings.instance.googleSocialRegisterButtonText,
                  logoPath: ImagePaths.instance.googleLogoPath,
                  size: size,
                ),
                verticalSpace(height: 4),
                SocialAuthenticateButton(
                  instruction:
                      AppStrings.instance.facebookSocialRegisterButtonText,
                  logoPath: ImagePaths.instance.facebookLogoPath,
                  size: size,
                ),
                verticalSpace(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.instance.loginNavText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        horizontalSpace(width: 10),
                        GestureDetector(
                          onTap: () => context.replace(
                              AppRoutePaths.instance.loginScreenRoutePath),
                          child: Text(
                            AppStrings.instance.loginButtonText,
                            style: TextStyle(
                              color: AppColors.instance.darkPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
