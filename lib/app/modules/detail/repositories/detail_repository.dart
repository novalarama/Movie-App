import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class DetailRepository extends GetConnect {
  @override
  final connect = GetApi();
  final api_key = '81728309a12b337c7334a06681733deb';

  Future<Response> getDetailFilm(var idFilm, var page) => connect.getData('movie/$idFilm', {'api_key':api_key,'page': page});
}
