
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

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.enrolledStudentIds.contains('S1'), isTrue);

  });

  test('prevents enrollment of a nonexistent student', () {
    final LmsSystem lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    expect(() => lms.enrollStudent(studentId: 'S99', courseId: 'C1'),throwsException);
  });

  test('add result', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    final result = lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      resultId: 'R1',
      score: 85,
    );

    expect(result.score, 85);

  });

  test('prevent duplicate enrollment', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(() => lms.enrollStudent(studentId: 'S1', courseId: 'C1'), throwsException);

  });

  test('remove a course and its result', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      resultId: 'R1',
      score: 85,
    );

    lms.removeCourse(courseId: 'C1');

    expect(lms.courses, isEmpty);
    expect(lms.results, isEmpty);
    expect(lms.students.length, 1);
  });

  test('remove a student from a course', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: "ronan");
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Develoment');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');

    expect(lms.courses.first.enrolledStudentIds, isEmpty);
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);
  });

  test('reject score outside rang from 0-100', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    expect(() => lms.addResult(
        studentId: 'S1',
        courseId: 'C1',
        resultId: 'R1',
        score: 101,
      ), throwsException,
    );
  });

  test('remove ', () {
    final LmsSystem lms = LmsSystem();

    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');

    lms.addResult(
      studentId: 'S1',
      courseId: 'C1',
      resultId: 'R1',
      score: 85,
    );

    lms.removeResult(resultId: 'R1');

    expect(lms.results, isEmpty);
    expect(lms.students.length, 1);
    expect(lms.courses.length, 1);

  });

  test('add assignment to the course', () {
    final LmsSystem lms = LmsSystem();

    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');

    lms.addAssignmentToCourse(
      courseId: 'C1',
      assignmentId: 'A1',
      title: 'Dart Homework',
    );

    expect(lms.courses.first.assignments, contains('A1: Dart Homework'));
  });
}
