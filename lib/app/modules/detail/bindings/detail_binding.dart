import 'package:get/get.dart';
import 'package:movie/app/modules/detail/repositories/detail_repository.dart';
import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailRepository());
    Get.lazyPut(() => DetailController(detailRepository: Get.find()));
  }
}
