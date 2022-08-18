import 'package:get/get.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';
import 'package:movie/app/models/detail_film.dart';

class DetailController extends GetxController with StateMixin {
  final DataFilmProvider data;
  DetailController({required this.data});

  final int idFilm = Get.arguments;

  final detailFilm = DetailFilm().obs;

  // convert mintues to hours
  // void getTimeString(runtime) {
  //   final int hour = runtime ~/ 60;
  //   final int minutes = runtime % 60;
  //   fixRuntime = '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}' as RxString;
  // }

  // get runtime data's
  void getDetailFilm() {
    data.getDetailFilm(idFilm).then((result) {
      detailFilm.value = DetailFilm.fromJson(result.body);

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDetailFilm();
  }
}
