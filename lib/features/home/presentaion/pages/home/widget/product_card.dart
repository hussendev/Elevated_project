import 'package:elevated_project/core/extensions/sized_box_extension.dart';
import 'package:elevated_project/core/extensions/string_extensions.dart';
import 'package:elevated_project/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/home_product_model.dart';


class ProductCard extends StatelessWidget {
  final HomeProductModel product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color:Colors.blue),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Expanded(
            flex: 2,
            child:Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.network(product.image!, fit: BoxFit.cover,),
                ),
              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.all(10.w),
                      height: 30.h,
                      width: 30.w,
                      decoration:const  BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle
                      ),
                child:   IconButton(
                  padding: EdgeInsets.zero,
                  icon:const Icon(
                    Icons.favorite_border,
                    color: Colors.blue,
                  ),
                  onPressed: () {

                  },
                ),
                    ),

              ],
            )
            // child:Column(
            //   children: [
            //
            //     PositionedDirectional(
            //
            //       child: )
            //   ],
            // )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text:product.title!.handleLargeText(), fontSize: 15.sp,fontWeight: FontWeight.bold,),

                AppText(text: '\$${product.price?.toStringAsFixed(2)}', fontSize: 18.sp,fontWeight: FontWeight.bold,),
                Row(
                  children: [
                    AppText(text: 'Review', fontSize: 18.sp,fontWeight: FontWeight.bold,),
                    4.ph(),
                    AppText(text: ' (${product.rating?.rate!.toString()}) ', fontSize: 18.sp,fontWeight: FontWeight.bold,),
                    4.ph(),
                    const Icon(Icons.star, color: Colors.amber,),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle

                        // borderRadius: BorderRadius.,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 18.sp,),
                    )

                  ],
                )

              ],
            ),
          )
        ],
      ),
      // child:,
    );
  }
}