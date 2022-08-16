import 'package:get/get.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';
import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DataFilmProvider());
    Get.lazyPut(() => DetailController(data: Get.find()));
  }
}
