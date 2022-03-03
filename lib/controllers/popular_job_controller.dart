import 'package:get/get.dart';
import 'package:shramik/data/repository/popular_job_repo.dart';
import 'package:shramik/modals/jobs_modal.dart';

class PopularJobController extends GetxController {
  final PopularJobRepo popularJobRepo;
  PopularJobController({required this.popularJobRepo});
  List<dynamic> _popularJobList = [];
  List<dynamic> get popularJobList => _popularJobList;

  Future<void> getPopularJobList() async {
    Response response = await popularJobRepo.getPopularJobList();
    if (response.statusCode == 200) {
      _popularJobList = [];
      _popularJobList.addAll(Job.fromJson(response.body).Jobs);
      update();
    } else {}
  }
}
