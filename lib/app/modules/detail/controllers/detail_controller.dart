import 'package:get/get.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';
import 'package:movie/app/models/RuntimeModel.dart';

class DetailController extends GetxController with StateMixin {
  final DataFilmProvider data;
  DetailController({required this.data});

  final Results listFilm = Get.arguments;

  final runtime = 0.obs;
  // late RxString fixRuntime = "".obs;

  // convert mintues to hours
  // void getTimeString(runtime) {
  //   final int hour = runtime ~/ 60;
  //   final int minutes = runtime % 60;
  //   fixRuntime = '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}' as RxString;
  // }

  // get runtime data's
  void getDataRuntime() {
    data.getDuration(listFilm.id).then((result) {
      runtime.value = RuntimeModel.fromJson(result.body).runtime!;

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    super.onInit();
    getDataRuntime();
    // getTimeString(runtime);
  }
}
