import 'package:elevated_project/core/network/api_controller.dart';
import 'package:elevated_project/features/home/data/repositories/home_repository_impl.dart';
import 'package:elevated_project/features/home/domain/repositories/home_repository.dart';
import 'package:elevated_project/features/home/domain/usecases/home_use_case.dart';
import 'package:elevated_project/features/home/presentaion/controllers/cubits/home/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../observer/bloc_observer.dart';

final getIt = GetIt.instance;


Future<void> init() async {
  /// Cubits ///
  getIt.registerFactory<HomeProductCubit>(
        () {
      return HomeProductCubit(
        homeUseCase: getIt(),
      );
    },
  );


  // /// Usecases ///
  getIt.registerLazySingleton<HomeProductUseCase>(
          () => HomeProductUseCase(homeProductRepo: getIt()));

  // /// Repository ///
  getIt.registerLazySingleton<HomeProductRepository>(
          () => HomeProductRepositoryImpl(remoteDataSource: getIt(),connectionChecker: getIt()));

  // /// Data Source ///
  getIt.registerLazySingleton<HomeRemoteDataSource>(() =>HomeRemoteDataSource(apiController: getIt()));

  /// Externals ///
  getIt.registerLazySingleton(() => ApiController());
  getIt.registerFactory<InternetConnectionChecker>(() {
    return InternetConnectionChecker();

  },);


  // Observers
  Bloc.observer = MyBlocObserver();
}
