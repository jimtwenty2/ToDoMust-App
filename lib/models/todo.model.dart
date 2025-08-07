import 'package:get/get.dart';

class TodoModel {
  final String id;
  String task;
  String date;
  RxBool isCompleted;

  TodoModel({
    required this.id,
    required this.task,
    required this.date,
    required bool isCompleted,
  }) : isCompleted = isCompleted.obs;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'], // Keep this consistent
      task: json['task'],
      date: json['date'],
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task'] = task;
    data['date'] = date;
    data['isCompleted'] = isCompleted.value;
    return data;
  }
}
