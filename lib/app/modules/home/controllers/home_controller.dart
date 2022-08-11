import 'package:get/get.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';

class HomeController extends GetxController with StateMixin<Map> {
  final DataFilmProvider dataFilmProvider;
  HomeController({required this.dataFilmProvider});

  final listNowPlaying = <Results>[].obs;
  final listPopular = <Results>[].obs;
  final listTopRated = <Results>[].obs;
  final listUpcoming = <Results>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNowPlayingFilm();
    fetchPopularFilm();
    fetchTopRatedFilm();
    fetchUpcomingFilm();
  }

  void fetchNowPlayingFilm() {
    dataFilmProvider.getNowPlaying().then((result) {
      listNowPlaying.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchPopularFilm() {
    dataFilmProvider.getPopular().then((result) {
      listPopular.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchTopRatedFilm() {
    dataFilmProvider.getTopRated().then((result) {
      listTopRated.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void fetchUpcomingFilm() {
    dataFilmProvider.getUpcoming().then((result) {
      listUpcoming.value = FilmModel.fromJson(result.body).results!; // change type string to object
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
