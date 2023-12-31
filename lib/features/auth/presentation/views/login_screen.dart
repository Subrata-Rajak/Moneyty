import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moneyty/core/common/widgets.dart';
import 'package:moneyty/core/routes/route_paths.dart';
import 'package:moneyty/core/utils/assets_paths.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_bloc.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_events.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_states.dart';
import 'package:moneyty/features/auth/presentation/widgets/email_input_field.dart';
import 'package:moneyty/features/auth/presentation/widgets/expanded_authenticate_button.dart';
import 'package:moneyty/features/auth/presentation/widgets/login_password_input_field.dart';
import 'package:moneyty/features/auth/presentation/widgets/social_authenticate_button.dart';
import 'package:moneyty/injection_container.dart';
import 'package:moneyty/src/values/color.dart';
import 'package:moneyty/src/values/string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with CommonWidgets {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocProvider<LoginScreenBloc>(
            create: (context) => sl(),
            child: BlocBuilder<LoginScreenBloc, LoginScreenStates>(
              builder: (loginContext, state) {
                if (state is LoggingUserInState) {
                  return Stack(
                    children: [
                      buildBody(
                        size: size,
                        context: loginContext,
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
                      context: loginContext,
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
              bottom: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.instance.loginText,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpace(height: 5),
                Text(
                  AppStrings.instance.loginSubText,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                verticalSpace(height: 25),
                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      EmailInputField(
                        controller: emailController,
                      ),
                      verticalSpace(height: 15),
                      LoginPasswordInputField(
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                verticalSpace(height: 30),
                ExpandedAuthenticateButton(
                  instruction: AppStrings.instance.loginButtonText,
                  size: size,
                  onPressed: () {
                    if (_loginFormKey.currentState!.validate()) {
                      context.read<LoginScreenBloc>().add(
                            LoginUserInEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    }
                  },
                ),
                verticalSpace(height: 4),
                SocialAuthenticateButton(
                  instruction: AppStrings.instance.googleSocialLoginButtonText,
                  logoPath: ImagePaths.instance.googleLogoPath,
                  size: size,
                ),
                verticalSpace(height: 4),
                SocialAuthenticateButton(
                  instruction:
                      AppStrings.instance.facebookSocialLoginButtonText,
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
                          AppStrings.instance.registerNavText,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        horizontalSpace(width: 10),
                        GestureDetector(
                          onTap: () => context.replace(
                              AppRoutePaths.instance.registerScreenPath),
                          child: Text(
                            AppStrings.instance.registerButtonText,
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
