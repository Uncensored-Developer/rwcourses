import 'package:rwcourses/repositories/course_repository.dart';

import '../../models/course.dart';
import '../../repositories/repository.dart';

class CoursesController {
  final Repository _repository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
