import 'package:get/get.dart';
import 'package:shramik/controllers/popular_job_controller.dart';
import 'package:shramik/data/api/api_client.dart';
import 'package:shramik/data/repository/popular_job_repo.dart';

Future<void> init() async {
  // Apiclients
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));

  //Repos
  Get.lazyPut(() => PopularJobRepo(apiClient: Get.find()));

  //Controllers
  Get.lazyPut(() => PopularJobController(popularJobRepo: Get.find()));
}
