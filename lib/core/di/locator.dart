import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartx/features/devices/data/datasource/temp_data_source.dart';
import 'package:smartx/features/devices/data/repository_impl/repository_impl.dart';
import 'package:smartx/features/devices/domain/repository/device_repository.dart';
import 'package:smartx/features/devices/domain/usecase/add_new_routine_usecase.dart';
import 'package:smartx/features/devices/domain/usecase/get_all_device_usecase.dart';
import 'package:smartx/features/devices/presentation/bloc/device_bloc.dart';
import 'package:smartx/features/splash/data/datasource/user_local_data_source.dart';
import 'package:smartx/features/splash/data/repository_impl/user_repository_impl.dart';
import 'package:smartx/features/splash/domain/repository/user_repository.dart';
import 'package:smartx/features/splash/domain/usecase/cache_user_usecase.dart';
import 'package:smartx/features/splash/domain/usecase/get_user_usecase.dart';
import 'package:smartx/features/splash/presentation/bloc/user_bloc.dart';

GetIt locator = GetIt.instance;

setupLocator() async {
  // splash
  await splashLocator();
  // device
  await deviceLocator();
}

// splash
splashLocator() async {
  locator.registerFactory(
    () => UserBloc(
      cacheUserUseCase: locator(),
      getUserUseCase: locator(),
    ),
  );
  locator.registerLazySingleton(() => CacheUserUseCase(locator()));
  locator.registerLazySingleton(() => GetUserUseCase(locator()));
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userLocalDataSource: locator()));
  locator.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(sharedPreferences: locator()));
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}

// device
deviceLocator() async {
  locator.registerFactory(
    () => DeviceBloc(
        getAllDevicesUseCase: locator(), addNewRoutineUseCase: locator()),
  );
  locator.registerLazySingleton(() => GetAllDevicesUseCase(locator()));

  locator.registerLazySingleton(() => AddNewRoutineUseCase(locator()));

  locator.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(dataSource: locator()));
  locator.registerLazySingleton<TempDataSource>(() => TempDataSourceImpl());
}
