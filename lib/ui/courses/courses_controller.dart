import '../../models/course.dart';
import '../../repositories/course_repository.dart';
import '../../repositories/repository.dart';

class CoursesController {
  final Repository _respository = CourseRepository();

  Future<List<Course>> fetchCourses(int domainFilter) {
    return _respository.getCourses(domainFilter);
  }
}
