import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    String? id, // id opsiyonel olabilir
  }) : id = id ?? Uuid().v4(); // 'const' kaldırıldı

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: DateTime.parse(map['dueDate']),
    );
  }
}