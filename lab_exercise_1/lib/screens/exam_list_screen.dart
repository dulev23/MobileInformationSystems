import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_exercise_1/models/exam.dart';
import 'package:lab_exercise_1/screens/exam_detail_screen.dart';
import 'package:lab_exercise_1/widgets/badge_widget.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams;
  final String studentIndex;

  const ExamListScreen({
    Key? key,
    required this.exams,
    required this.studentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Распоред за испити - $studentIndex')),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          final isPast = exam.dateTime.isBefore(DateTime.now());

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exam),
                ),
              );
            },
            child: Card(
              color: isPast ? Colors.grey[300] : Colors.blue[100],
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                title: Text(
                  exam.subject,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd.MM.yyyy, HH:mm').format(exam.dateTime),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Text(exam.rooms.join(', ')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 40,
          child: Center(
            child: BadgeWidget(
              text: '${exams.length} испити',
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}