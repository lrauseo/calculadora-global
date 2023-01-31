import 'package:calculadora_global/app_routes.dart';
import 'package:calculadora_global/modules/renda_fixa/renda_fixa_calc_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RobotDetector(
        debug: true,
        child: GetMaterialApp(
          title: 'Calculadora Global',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/",
          initialBinding: RendaFixaCalcBind(),
          getPages: AppRoutes.allRoutes(),
          navigatorObservers: [seoRouteObserver],
        ));
  }
}
