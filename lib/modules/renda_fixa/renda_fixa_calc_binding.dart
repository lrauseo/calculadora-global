import 'package:calculadora_global/modules/renda_fixa/renda_fixa_calc_controller.dart';
import 'package:calculadora_global/repository/renda_fixa_repository.dart';
import 'package:calculadora_global/repository/renda_fixa_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RendaFixaCalcBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RendaFixaCalcController());
    Get.lazyPut(() => Dio());

    Get.lazyPut(() => RendaFixaRepositoryImpl());
  }
}
