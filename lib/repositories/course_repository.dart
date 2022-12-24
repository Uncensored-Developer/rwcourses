import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rwcourses/constants.dart';
import 'package:rwcourses/models/course.dart';

import 'repository.dart';

class CourseRepository implements Repository {
  String dataURL =
      'https://api.raywenderlich.com/api/contents?filter[content_types][]=collection';

  @override
  Future<List<Course>> getCourses(int domainFilter) async {
    final courses = <Course>[];
    var url = dataURL;

    if (domainFilter != Constants.allFilter) {
      url += ';&filter[domain_ids][]=$domainFilter';
    }

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final apiResponse = json.decode(response.body) as Map<String, dynamic>;
    print(apiResponse);
    return courses;
  }
}
