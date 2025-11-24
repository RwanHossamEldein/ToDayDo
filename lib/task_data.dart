class TaskData {
  String title;
  bool isDone;
  String startDate;
  String endDate;

  TaskData({
    required this.title,
    this.isDone = false,
    required this.startDate,
    required this.endDate,
  });
}
