import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Görevler', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal.shade800,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/add-task');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // İki sütun
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2, // Kare şeklinde olmasını sağlamak için
          ),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900, // Koyu gri arka plan
                borderRadius: BorderRadius.circular(12), // Köşe yuvarlatma
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Hafif gölge
                    offset: Offset(2, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              padding: EdgeInsets.all(16), // Daha geniş boşluk
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Başlık rengi beyaz
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    task.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400), // Açıklama rengi gri
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Spacer(),
                  Text(
                    "Son Teslim Tarihi: ${task.dueDate.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500), // Tarih rengi gri
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red.shade600),
                      onPressed: () {
                        // Görevi silmek için iş mantığı
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
