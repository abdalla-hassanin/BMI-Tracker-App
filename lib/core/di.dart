import 'package:bmi_tracker_app/features/app/domain/use_cases/delete_bmi_use_case.dart';
import 'package:bmi_tracker_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:bmi_tracker_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bmi_tracker_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:bmi_tracker_app/features/auth/domain/use_cases/register_ues_case.dart';
import 'package:bmi_tracker_app/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:bmi_tracker_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:bmi_tracker_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:bmi_tracker_app/features/app/data/data_sources/bmi_data_source.dart';
import 'package:bmi_tracker_app/features/app/data/repositories/bmi_repository_impl.dart';
import 'package:bmi_tracker_app/features/app/domain/repositories/bmi_repository.dart';

import '../features/app/domain/use_cases/add_bmi_use_case.dart';
import '../features/app/domain/use_cases/fetch_bmi_use_case.dart';
import '../features/app/presentation/manager/home_provider.dart';

final GetIt getIt = GetIt.instance;

void setupDI() {
  //Auth
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());

  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthDataSource>()));

  getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(getIt<AuthRepository>()));

  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider(
      RegisterUseCase(getIt<AuthRepository>()),
      SignInUseCase(getIt<AuthRepository>()),
      SignOutUseCase(getIt<AuthRepository>())));

  getIt.registerLazySingleton<BMIDataSource>(() => BMIDataSource());

  getIt.registerLazySingleton<BMIRepository>(
    () => BMIRepositoryImpl(getIt<BMIDataSource>()),
  );

  getIt.registerLazySingleton<AddBMIModelUseCase>(
    () => AddBMIModelUseCase(getIt<BMIRepository>()),
  );

  getIt.registerLazySingleton<FetchBMIsUseCase>(
    () => FetchBMIsUseCase(getIt<BMIRepository>()),
  );

  getIt.registerLazySingleton<DeleteBMIModelUseCase>(
    () => DeleteBMIModelUseCase(getIt<BMIRepository>()),
  );
  getIt.registerLazySingleton<HomeProvider>(() => HomeProvider(
        AddBMIModelUseCase(getIt<BMIRepository>()),
        FetchBMIsUseCase(getIt<BMIRepository>()),
        DeleteBMIModelUseCase(getIt<BMIRepository>()),
      ));
}
