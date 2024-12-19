// screens/task_list_screen.dart
import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListScreen extends StatelessWidget {
  final List<Task> tasks;

  TaskListScreen({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görev Listesi', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple.shade800, // Önerilen renk
        centerTitle: true,      
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text(
                'Henüz bir görev eklenmedi.',
                style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      task.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    subtitle: Text(
                      'Son Tarih: ${task.dueDate.toLocal()}'.split(' ')[0],
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red.shade600),
                      onPressed: () {
                        // Görevi silmek için iş mantığı
                      },
                    ),
                    onTap: () {
                      // Görev detay sayfasına yönlendirme
                      Navigator.pushNamed(context, '/task-detail', arguments: task);
                    },
                  ),
                );
              },
            ),
    );
  }
}
