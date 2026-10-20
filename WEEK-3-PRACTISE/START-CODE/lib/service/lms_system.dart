import 'package:lms_layered_architecture_example/model/course.dart';
import 'package:lms_layered_architecture_example/model/result.dart';

import '../model/student.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<String> assignments = [];
  final List<Result> results = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    for (Course c in courses) {
      c.enrolledStudentIds.removeWhere((id) => id == studentId);
    }

    results.removeWhere((result) => result.studentId == studentId);
  }

  void addCourse({required String courseId, required String courseName}) {
    Course? existId = _findCourseOrNull(courseId);
    if (existId != null) {
      throw Exception("Course ${courseId} already exist!");
    }

    var newCourse = Course(id: courseId, name: courseName);
    courses.add(newCourse);
  }

  void removeCourse({required String courseId}) {
    Course? existCourseId = _findCourseOrNull(courseId);
    if (existCourseId == null) {
      throw Exception("Course with $courseId is not found!");
    }

    results.removeWhere((e) => e.courseId == courseId);

    courses.removeWhere((course) => course.id == courseId);
  }

  void enrollStudent({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if (student == null) {
      throw Exception("This ${studentId} does not exist!");
    }
    if (course == null) {
      throw Exception("This ${courseId} does not exist!");
    }
    if (course.enrolledStudentIds.contains(studentId)) {
      throw Exception("This ${studentId} alreay enroll to the course!");
    }

    course.enrolledStudentIds.add(studentId);
  }

  void addAssignmentToCourse({
    required String courseId, 
    required String assignmentId, 
    required String title,
  }) {
    Course? existCourseId = _findCourseOrNull(courseId);
    if (existCourseId == null) {
      throw Exception("This course ${courseId} is not found!");
    }
    
    if (existCourseId.assignments.any(
      (assignment) => assignment.startsWith('$assignmentId:'),
    )) {
      throw Exception('Assignment $assignmentId already exists!');
    }

    existCourseId.assignments.add('$assignmentId: $title');
  }

  void discardStudentFromCourse({required String studentId, required String courseId}) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if (student == null) {
      throw Exception("This ${studentId} does not exist!");
    }
    if (course == null) {
      throw Exception("This ${courseId} does not exist!");
    }
    if (!course.enrolledStudentIds.contains(studentId)) {
      throw Exception("This ${studentId} not enroll to the course!");
    }

    course.enrolledStudentIds.remove(studentId);

    results.removeWhere((e) => e.studentId == studentId && e.courseId == courseId);
  }

  Result addResult({
    required String studentId,
    required String courseId,
    required String resultId,
    required int score
  }) {
    Student? student = _findStudentOrNull(studentId);
    Course? course = _findCourseOrNull(courseId);

    if (student == null) {
      throw Exception("This ${studentId} does not exist!");
    }
    if (course == null) {
      throw Exception("This ${courseId} does not exist!");
    }
    if (!course.enrolledStudentIds.contains(studentId)) {
      throw Exception('Student $studentId is not registered for course $courseId yet!');
    }
    if (score < 0 || score > 100) {
      throw Exception("Score must be between 0 and 100!");
    }
    if (results.any((e) => e.resultId == resultId)) {
      throw Exception("Result ${resultId} already exist!");
    }

    Result result = Result(
        resultId: resultId,
        studentId: studentId,
        courseId: courseId,
        score: score); //each result has a unique resultId

    results.add(result);
    return result;
  }

  void removeResult({required String resultId}) {
    Result? existResultId = _findResultOrNull(resultId);

    if (existResultId == null) {
      throw Exception("This result $resultId does not exist!");
    }
    results.remove(existResultId);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course c in courses) {
      if (c.id == courseId) {
        return c;
      }
    }
    return null;
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Result? _findResultOrNull(String resultId) {
    for (Result r in results) {
      if (r.resultId == resultId) {
        return r;
      }
    }
    return null;
  }
}


