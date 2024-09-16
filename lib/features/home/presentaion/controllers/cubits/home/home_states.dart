
import 'package:equatable/equatable.dart';

import '../../../model/home_product_model.dart';

abstract class HomeProductStates extends Equatable {
  const HomeProductStates();

  @override
  List<Object> get props => [];
}

class HomeProductInitial extends HomeProductStates {}

class HomeProductLoadingState extends HomeProductStates {}

class HomeProductLoadedState extends HomeProductStates {
  final List<HomeProductModel> products;

  const HomeProductLoadedState(
      {required this.products}
      );
}

class HomeProductErrorState extends HomeProductStates {
  final String message;

  const HomeProductErrorState({required this.message});
}