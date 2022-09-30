import 'package:calculadora_global/main.dart';
import 'package:calculadora_global/modules/home/home_page.dart';
import 'package:calculadora_global/modules/renda_fixa/renda_fixa_calc_binding.dart';
import 'package:calculadora_global/modules/renda_fixa/renda_fixa_calc_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> allRoutes() {
    return <GetPage>[
      GetPage(name: "/renda_fixa", page: () => const RendaFixaCalcPage(), binding: RendaFixaCalcBind()),
      GetPage(name: "/", page: () => const HomePage()),
    ];
  }
}
