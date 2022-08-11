import 'package:get/get.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataFilmProvider());
    Get.lazyPut(() => HomeController(dataFilmProvider: Get.find()));
  }
}
