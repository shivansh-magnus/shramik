import 'dart:developer';

class Job {
  late List<JobModol> jobs;
  List<dynamic> get Jobs => jobs;

  Job({required this.jobs});

  Job.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <JobModol>[];
      json['jobs'].forEach((j) {
        jobs.add(JobModol.fromJson(j));
      });
    }
  }
}

class JobModol {
  int? _id;
  String? _imgURL;
  String? _jobType;
  String? _pay;
  String? _timeline;
  List<Location>? _location;

  JobModol({
    required id,
    required imgURL,
    required jobType,
    required pay,
    required timeline,
    required location,
  }) {
    this._imgURL = imgURL;
    this._id = id;
    this._jobType = jobType;
    this._pay = pay;
    this._timeline = timeline;
    this._location = location;
  }

  JobModol.fromJson(Map<String, dynamic> json) {
    _imgURL = json['imgURL'];
    _id = json['id'];
    _jobType = json['jobType'];
    _pay = json['pay'];
    _timeline = json['timeline'];
  }
}

class Location {
  int? pincode;
  String? city;
  String? country;

  Location({this.city, this.country, this.pincode});
  Location.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    pincode = json['pincode'];
  }
}
