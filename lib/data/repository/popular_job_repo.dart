import 'package:get/get_connect/connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shramik/data/api/api_client.dart';

class PopularJobRepo extends GetxService {
  final ApiClient apiClient;

  PopularJobRepo({required this.apiClient});

  Future<Response> getPopularJobList() async {
    return apiClient.get("/api//v1/product/list");
  }
}
