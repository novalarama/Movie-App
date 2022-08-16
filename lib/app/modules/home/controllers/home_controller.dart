import 'package:get/get.dart';
import 'package:movie/app/models/FilmModel.dart';
import 'package:movie/app/repository/providers/data_film_provider.dart';
import 'package:movie/app/models/genre_model.dart';

class HomeController extends GetxController with StateMixin {
  final DataFilmProvider dataFilmProvider;
  HomeController({required this.dataFilmProvider});

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

  // listFilm[index].genreIds!.where((element) => element.runtimeType != int).toList();

  // fetch data now playing film
  void fetchNowPlayingFilm() {
    dataFilmProvider.getNowPlaying().then((result) {
      listNowPlaying.value = FilmModel.fromJson(result.body).results!;
      // fetch genre data
      listGenre.forEach((data) {
        listNowPlaying.forEach((value) {
          for (var i = 0; i < value.genreIds!.length; i++) {
            if (data.id == value.genreIds![i]) {
              value.genreIds!.add(data.name);
            }
          }
        });
      });

      listNowPlaying.forEach((element) {
        element.genreIds!.removeWhere((val) => val.runtimeType == int);
      });

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data popular film
  void fetchPopularFilm() {
    dataFilmProvider.getPopular().then((result) {
      listPopular.value = FilmModel.fromJson(result.body).results!;
      // fetch genre data
      listGenre.forEach((data) {
        listPopular.forEach((value) {
          for (var i = 0; i < value.genreIds!.length; i++) {
            if (data.id == value.genreIds![i]) {
              value.genreIds!.add(data.name);
            }
          }
        });
      });

      listPopular.forEach((element) {
        element.genreIds!.removeWhere((val) => val.runtimeType == int);
      });

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data top rated film
  void fetchTopRatedFilm() {
    dataFilmProvider.getTopRated().then((result) {
      listTopRated.value = FilmModel.fromJson(result.body).results!;
      // fetch genre data
      listGenre.forEach((data) {
        listTopRated.forEach((value) {
          for (var i = 0; i < value.genreIds!.length; i++) {
            if (data.id == value.genreIds![i]) {
              value.genreIds!.add(data.name);
            }
          }
        });
      });

      listTopRated.forEach((element) {
        element.genreIds!.removeWhere((val) => val.runtimeType == int);
      });

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // fetch data upcoming film
  void fetchUpcomingFilm() {
    dataFilmProvider.getUpcoming().then((result) {
      listUpcoming.value = FilmModel.fromJson(result.body).results!;
      // fetch genre data
      listGenre.forEach((data) {
        listUpcoming.forEach((value) {
          for (var i = 0; i < value.genreIds!.length; i++) {
            if (data.id == value.genreIds![i]) {
              value.genreIds!.add(data.name);
            }
          }
        });
      });

      listUpcoming.forEach((element) {
        element.genreIds!.removeWhere((val) => val.runtimeType == int);
      });

      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  // function for fetch genreIds data with genre film
  void getDataGenre() {
    dataFilmProvider.getGenre().then((result) {
      listGenre.value = Genre.fromJson(result.body).genres!;
      change(null, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
  
}
