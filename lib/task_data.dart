import 'dart:convert';

class TaskData {
  String title;
  bool isDone;
  DateTime? startDate;
  DateTime ?endDate;
   bool isSaved;

  TaskData({
    required this.title,
    this.isDone = false,
    this.startDate,
    this.endDate,
  this.isSaved=true
  });
  
  Map<String,dynamic> toMap() {
  return {
    'title': title,
    'isDone': isDone,
    'startDate': startDate?.toIso8601String(),
    'endDate': endDate?.toIso8601String(),
    'isSaved': isSaved,
  };
}

factory TaskData.fromMap(Map<String,dynamic> map) {
  return TaskData(
    title: map['title'],
    isDone: map['isDone'] ?? false,
    startDate: map['startDate'] != null ? DateTime.parse(map['startDate']) : null,
    endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
    isSaved: map['isSaved'] ?? true,
  );
}

  String toJson() => json.encode(toMap());
  factory TaskData.fromJson(String source) => TaskData.fromMap(json.decode(source));
}
