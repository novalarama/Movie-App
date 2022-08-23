import 'package:get/get.dart';
import 'package:movie/app/modules/category/repositories/category_repository.dart';
import '../controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryRepository());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  }
}
