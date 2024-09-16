import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/home_use_case.dart';
import 'home_states.dart';

class HomeProductCubit extends Cubit<HomeProductStates> {
  final HomeProductUseCase _homeProductUseCase;
  HomeProductCubit({required HomeProductUseCase homeUseCase}) :_homeProductUseCase=homeUseCase, super(HomeProductInitial());

  loadProducts() async {
    emit(HomeProductLoadingState());
    var result = await _homeProductUseCase.getHomeData();

    result.fold((l) {
      emit(HomeProductErrorState(message: l.message));
    }, (r) {
      emit(HomeProductLoadedState(products: r));
    });

  }
}
