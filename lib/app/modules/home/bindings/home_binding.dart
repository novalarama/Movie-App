import 'package:get/get.dart';
import 'package:movie/app/modules/home/repositories/home_repository.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepository());
    Get.lazyPut(() => HomeController(homeRepository: Get.find()));
  }
}
