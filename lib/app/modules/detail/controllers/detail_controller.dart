import 'package:get/get.dart';
import 'package:movie/app/modules/detail/repositories/detail_repository.dart';
import 'package:movie/app/models/detail_film.dart';

class DetailController extends GetxController with StateMixin {
  final DetailRepository detailRepository;
  DetailController({required this.detailRepository});

  final int idFilm = Get.arguments;
  final detailFilm = DetailFilm().obs;

   @override
  void onInit() {
    super.onInit();
    getDetailFilm();
  }

  // get runtime data's
  void getDetailFilm() {
    detailRepository.getDetailFilm(idFilm).then((result) {
      detailFilm.value = DetailFilm.fromJson(result.body);

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
