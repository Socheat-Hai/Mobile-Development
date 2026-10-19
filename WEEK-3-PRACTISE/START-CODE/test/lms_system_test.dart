
import 'package:lms_layered_architecture_example/service/lms_system.dart';
import 'package:test/test.dart';


void main() {
  test('creates a student', () {
    final LmsSystem lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

  });

  test('Remove student', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  test('add course', () {
    final LmsSystem lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    expect(lms.courses.first.id, 'C1');
    expect(lms.courses.length, 1);

  });

  test('prevent duplicate student IDs', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(
      () => lms.addStudent(studentId: 'S1', studentName: 'ronan'),
      throwsException,
    );
  });

  test('prevents duplicate course IDs', () {
    final LmsSystem lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    expect(
      () => lms.addCourse(courseId: 'C1', courseName: 'Mobile Developmet'),
      throwsException,
    );
  });

  test('enrolls a student in a course', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent('S1', 'C1');

    expect(lms.courses.first.enrolledStudentIds.contains('S1'), isTrue);

  });

  test('prevents enrollment of a nonexistent student', () {
    final LmsSystem lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    expect(
      () => lms.enrollStudent('S99', 'C1'),
      throwsException
    );
  });

  test('test result', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent('S1', 'C1');

    final result = lms.addResult('S1', 'C1', 'R1', 85);

    expect(result.score, 85);

  });
}
