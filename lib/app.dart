import 'package:e_commerce/bindings/general_bindings.dart';
import 'package:e_commerce/features/authentification/screens/Onboarding/onboarding.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'utils/theme/theme.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home:  const OnBoardingClass(),
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      
      
    );

  }
}
