import 'package:get/get.dart';
import 'package:movie/app/providers/get_api.dart';

class DetailRepository extends GetConnect {
  @override
  final connect = GetApi();
  final api_key = GetApi().api_key;

  Future<Response> getDetailFilm(var idFilm, var page) => connect.getData('movie/$idFilm', {'api_key':api_key,'page': page});
}
