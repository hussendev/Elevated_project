
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../presentaion/model/home_product_model.dart';

abstract class HomeProductRepository {
  HomeProductRepository();
  Future<Either<Failure, List<HomeProductModel>>>getProductHomeData();

}