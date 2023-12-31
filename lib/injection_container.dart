import 'package:get_it/get_it.dart';
import 'package:moneyty/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:moneyty/features/auth/data/source/auth_service.dart';
import 'package:moneyty/features/auth/domain/repositories/auth_repository.dart';
import 'package:moneyty/features/auth/domain/usecases/login_user_usecase.dart';
import 'package:moneyty/features/auth/domain/usecases/register_user_usecase.dart';
import 'package:moneyty/features/auth/presentation/blocs/login_screen_bloc/login_screen_bloc.dart';
import 'package:moneyty/features/auth/presentation/blocs/register_screen_bloc/register_screen_bloc.dart';

final sl = GetIt.instance;

Future<void> initDep() async {
  //blocs
  sl.registerFactory<LoginScreenBloc>(
    () => LoginScreenBloc(
      loginUserUsecase: sl.call(),
    ),
  );

  sl.registerFactory<RegisterScreenBloc>(
    () => RegisterScreenBloc(
      registerUserUsecase: sl.call(),
    ),
  );

  //services
  sl.registerSingleton<AuthService>(AuthService());

  //repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(
      authService: sl.call(),
    ),
  );

  //usecases
  sl.registerSingleton<RegisterUserUsecase>(
    RegisterUserUsecase(
      authRepository: sl.call(),
    ),
  );

  sl.registerSingleton<LoginUserUsecase>(
    LoginUserUsecase(
      authRepository: sl.call(),
    ),
  );
}
