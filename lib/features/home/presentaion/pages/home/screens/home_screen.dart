
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../../../../core/widgets/app_text.dart';
import '../../../controllers/cubits/home/home_cubit.dart';
import '../../../controllers/cubits/home/home_states.dart';
import '../../../model/home_product_model.dart';
import '../widget/product_card.dart';

class HomeProductScreen extends StatelessWidget {
  const HomeProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: BlocBuilder<HomeProductCubit, HomeProductStates>(
        builder: (context, state) {
          if (state is HomeProductLoadingState ||state is  HomeProductInitial) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is HomeProductLoadedState) {
            return RefreshIndicator(
              onRefresh: () => context.read<HomeProductCubit>().loadProducts(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: state.products[index]);
                  },
                ),
              )
            );
          }
          else if (state is HomeProductErrorState) {
            return RefreshIndicator(
                onRefresh: () => context.read<HomeProductCubit>().loadProducts(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Text('Error: ${state.message}')),
                    ElevatedButton(
                      onPressed: () => context.read<HomeProductCubit>().loadProducts(),
                      child: const Text('Retry'),
                    ),
                  ],
                )
            );
            // return
          }
          return RefreshIndicator(
              onRefresh: () => context.read<HomeProductCubit>().loadProducts(),
              child: const Center(child: Text('No products'))
          );
        },
      ),
    );
    // return  Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     centerTitle: true,
    //     title: AppText(text: 'Elevated App', fontSize: 18.sp),
    //   ),
    //   body: Padding(
    //     padding: EdgeInsets.symmetric(horizontal: 10.w),
    //     child: BlocBuilder<HomeProductCubit,HomeProductStates>(
    //       builder: (context, state) {
    //         if(state is HomeProductLoadingState){
    //           return CircularProgressIndicator();
    //         }else if(state is HomeProductLoadedState){
    //            //
    //           return GridView.builder(
    //             physics:const  BouncingScrollPhysics(),
    //             itemCount: state.products.length,
    //             itemBuilder: (context, index) {
    //               HomeProductModel productModel=state.products[index];
    //               return Container(
    //                 // height: 180.h,
    //                 // width: 60.w,
    //                 decoration: BoxDecoration(
    //                     color: Colors.red,
    //                     borderRadius: BorderRadius.all(Radius.circular(18.r))
    //                 ),
    //                 // color: Colors.red,
    //               );
    //             },
    //             gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2,
    //               childAspectRatio: 0.8,
    //               crossAxisSpacing: 20,
    //               mainAxisSpacing:10,
    //
    //               // childAspectRatio:
    //             ),
    //
    //           );
    //         }else{
    //           state as HomeProductErrorState;
    //           return Center(child: Text(state.message));
    //         }
    //
    //       },
    //       buildWhen: (previous, current) {
    //         return current is HomeProductLoadedState || current is HomeProductLoadingState;
    //       },
    //     )
    //   )
    // );
  }
}
