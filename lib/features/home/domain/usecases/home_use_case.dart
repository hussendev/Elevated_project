
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../presentaion/model/home_product_model.dart';
import '../repositories/home_repository.dart';

class HomeProductUseCase {
  HomeProductRepository homeProductRepo;
  HomeProductUseCase({required this.homeProductRepo});

  Future<Either<Failure, List<HomeProductModel>>> getHomeData() async {
    return await homeProductRepo.getProductHomeData();

  }






}