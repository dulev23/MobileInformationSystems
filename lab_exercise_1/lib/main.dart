import 'package:flutter/material.dart';
import 'package:lab_exercise_1/models/exam.dart';
import 'package:lab_exercise_1/screens/exam_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Exam> exams = [
    Exam(
      subject: "Веројатност и статистика",
      dateTime: DateTime(2025, 11, 17, 9, 0),
      rooms: ["Амфитеатар МФ", "225"],
    ),
    Exam(
      subject: "Веб програмирање",
      dateTime: DateTime(2025, 11, 17, 13, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Бази на податоци",
      dateTime: DateTime(2025, 11, 19, 8, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Дизајн и архитектура на софтвер",
      dateTime: DateTime(2025, 11, 21, 8, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Оперативни системи",
      dateTime: DateTime(2024, 04, 10, 8, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Објектно-ориентирано програмирање",
      dateTime: DateTime(2024, 04, 11, 8, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Алгоритми и податочни структури",
      dateTime: DateTime(2023, 11, 17, 8, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Компјутерски мрежи и безбедност",
      dateTime: DateTime(2025, 11, 19, 10, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Дизајн на интеракцијата човек-компјутер",
      dateTime: DateTime(2025, 06, 14, 9, 0),
      rooms: ["215", "200АБ", "138", "117"],
    ),
    Exam(
      subject: "Калкулус",
      dateTime: DateTime(2022, 11, 19, 8, 0),
      rooms: ["Амфитеатар МФ", "225"],
    ),
  ];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return MaterialApp(
      title: 'Exam Schedule',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamListScreen(exams: exams, studentIndex: "221202"),
    );
  }
}
