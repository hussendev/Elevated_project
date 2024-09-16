import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../../presentaion/model/home_product_model.dart';
import '../datasources/home_remote_data_source.dart';

class HomeProductRepositoryImpl implements HomeProductRepository {
  final HomeRemoteDataSource remoteDataSource;
  final InternetConnectionChecker connectionChecker;

  HomeProductRepositoryImpl({required this.remoteDataSource,required this.connectionChecker});

  @override
  Future<Either<Failure, List<HomeProductModel>>> getProductHomeData() async {

      if(await connectionChecker.hasConnection){
        try {
          final result = await remoteDataSource.getProducts();

          return Right(result);
        } on ServerException {
          return Left(ServerFailure(message: 'Something Error'));
        }
      }else{
        return Left(NoInternetConnectionFailure(message: 'No Internet Connection'));
      }



  }

}