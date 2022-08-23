import 'package:get/get.dart';
import 'package:movie/app/models/film_model.dart';
import 'package:movie/app/modules/home/repositories/home_repository.dart';
import 'package:movie/app/models/genre_model.dart';

class HomeController extends GetxController with StateMixin {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  // prepare for film data based on category
  final listNowPlaying = <Results>[].obs;
  final listPopular = <Results>[].obs;
  final listTopRated = <Results>[].obs;
  final listUpcoming = <Results>[].obs;

  //prepare for genre data
  final listGenre = <AllGenres>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataGenre();
    fetchNowPlayingFilm();
    fetchPopularFilm();
    fetchTopRatedFilm();
    fetchUpcomingFilm();
  }

  // fetch data now playing film
  void fetchNowPlayingFilm() async {
    await homeRepository.getNowPlaying().then((result) {
      listNowPlaying.value = FilmModel.fromJson(result.body).results!;
      // fetch genre data
      replaceGenreIdsWithGenreNames(listNowPlaying);
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data popular film
  void fetchPopularFilm() async {
    await homeRepository.getPopular().then((result) {
      listPopular.value = FilmModel.fromJson(result.body).results!;
      replaceGenreIdsWithGenreNames(listPopular);

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data top rated film
  void fetchTopRatedFilm() async {
    await homeRepository.getTopRated().then((result) {
      listTopRated.value = FilmModel.fromJson(result.body).results!;
      replaceGenreIdsWithGenreNames(listTopRated);
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data upcoming film
  void fetchUpcomingFilm() async {
    await homeRepository.getUpcoming().then((result) {
      listUpcoming.value = FilmModel.fromJson(result.body).results!;
      replaceGenreIdsWithGenreNames(listUpcoming);
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // function for fetch genreIds data with genre film
  void getDataGenre() async {
    await homeRepository.getGenre().then((result) {
      listGenre.value = Genre.fromJson(result.body).genres!;
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void replaceGenreIdsWithGenreNames(List<Results> results) async {
    listGenre.forEach((data) {
      results.forEach((value) {
        for (var i = 0; i < value.genreIds!.length; i++) {
          if (data.id == value.genreIds![i]) {
            // value.genreIds!.add(data.name);
            value.genreIds![i] = data.name;
          }
        }
      });
    });
  }
}
