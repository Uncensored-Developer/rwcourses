import 'package:flutter/material.dart';
import 'package:rwcourses/models/course.dart';
import 'package:rwcourses/ui/course_detail/image_container.dart';
import 'package:rwcourses/ui/utils/string_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(course.name),
          backgroundColor: Colors.green.shade800,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            _buildMain(context),
            _buildDetails(context),
            TextButton(
                onPressed: () => _launchCourse(course.courseId),
                child: const Text('View Course'))
          ],
        ));
  }

  Widget _buildBanner() {
    return Hero(
        tag: 'cardArtWork-${course.courseId}',
        child: ImageContainer(url: course.artWorkUrl, height: 200));
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            course.name,
            style:
                Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 24),
          ),
          Text(
            course.description,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          )
        ],
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    const style = TextStyle(fontSize: 16);

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Domain(s): ${course.domainString}',
            style: style,
          ),
          Text(
            'Level: ${course.difficulty.capitalize()}',
            style: style,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              course.contributors,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  void _launchCourse(String courseId) async {
    await launchUrl(Uri.parse('https://raywenderlich.com/$courseId'));
  }
}
