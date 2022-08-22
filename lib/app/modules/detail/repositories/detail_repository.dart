import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class DetailRepository extends GetConnect {
  @override
  final connect = GetApi();

  Future<Response> getDetailFilm(var idFilm) => connect.getDetailFilm('movie', idFilm);
}
