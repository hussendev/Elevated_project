import 'package:elevated_project/features/home/presentaion/controllers/cubits/home/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/di/dependency_injection.dart';
import 'features/home/presentaion/pages/home/screens/home_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //important
  await init();

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(
          375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          title: 'Elevated App',
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (_) => getIt<HomeProductCubit>()..loadProducts(),
            child: const HomeProductScreen(),
          ),
          theme: ThemeData(
            fontFamily: GoogleFonts.cairo().fontFamily,

            // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(surface: Colors.white),
          ),
        );
      },
    );
  }
}
