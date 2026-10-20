class Course {
  final String id;
  final String name;
  final List<String> enrolledStudentIds = [];
  final List<String> assignments = [];

  Course({required this.id, required this.name});
}
