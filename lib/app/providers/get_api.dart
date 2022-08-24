import 'package:get/get.dart';

class GetApi extends GetConnect {
  @override
  final url = 'https://api.themoviedb.org/3/';

  Future<Response> getData(var endpoint, Map<String, dynamic> path) => get('${url}${endpoint}', query: path);
}
