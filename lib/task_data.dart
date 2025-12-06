class TaskData {
  String title;
  bool isDone;
  DateTime startDate;
  DateTime endDate;

  TaskData({
    required this.title,
    this.isDone = false,
    required this.startDate,
    required this.endDate,
  });
}
