import 'package:app/core/constants/api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NetworkRepository extends GetConnect {
  final GetStorage box = Get.find();

  NetworkRepository() {
    httpClient.baseUrl = apiUrl;
    httpClient.addRequestModifier<dynamic>((request) {
      final token = box.read<String?>('accessToken');
      final uid = box.read<String?>('uid');
      final client = box.read<String?>('client');
      request.headers.addAll({
        'uid': uid ?? '',
        'client': client ?? '',
        'access-token': token ?? '',
      });
      return request;
    });
  }
}
