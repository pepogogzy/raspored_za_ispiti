class Exam {
  final String subjectName;
  final DateTime dateTime;
  final List<String> rooms;
  final bool isPassed;

  const Exam({
    required this.subjectName,
    required this.dateTime,
    required this.rooms,
    required this.isPassed,
  });
}
