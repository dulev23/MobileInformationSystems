import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_exercise_1/models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  String _timeUntilExam() {
    final now = DateTime.now();
    if (exam.dateTime.isBefore(now)) {
      return "Испитот е завршен";
    }

    final difference = exam.dateTime.difference(now);
    final days = difference.inDays;
    final hours = difference.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(exam.subject)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Предмет: ${exam.subject}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(DateFormat('dd.MM.yyyy, HH:mm').format(exam.dateTime)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text(exam.rooms.join(', ')),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Време до испит: ${_timeUntilExam()}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
