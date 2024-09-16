import 'package:elevated_project/features/home/domain/entities/home/home_product_data.dart';
import 'package:logger/logger.dart';

import '../../../../core/network/api_controller.dart';
import '../../../../core/network/api_setting.dart';
import '../../presentaion/model/home_product_model.dart';

class HomeRemoteDataSource {
  final ApiController apiController;


  HomeRemoteDataSource({required this.apiController});

  Future<List<HomeProductModel>> getProducts() async {

    try {
      final response = await apiController.get(
        isRefresh: true,
        Uri.parse(ApiSetting.productsHome),
        headers: {
          'Content-Type': 'application/json'
        },
        timeToLive: 60 * 60 * 24,
      );
      return (response)
          .map((json) => HomeProductData.fromJson(json))
          .toList();
    } catch (e) {
      Logger().e(e);
      rethrow;
    }
  }

}