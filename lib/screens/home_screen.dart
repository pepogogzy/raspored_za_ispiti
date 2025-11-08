import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  List<Exam> _exams() {
    final now = DateTime.now();
    final data = <Exam>[
      Exam(subjectName: 'Алгоритми и податочни структури', dateTime: DateTime(now.year, 12, 2, 9, 0), rooms: ['АМФ1', 'ЛАБ3'], isPassed: false),
      Exam(subjectName: 'Бази на податоци', dateTime: DateTime(now.year, 12, 4, 10, 0), rooms: ['ЛАБ2'], isPassed: false),
      Exam(subjectName: 'Мрежна безбедност', dateTime: DateTime(now.year, 12, 6, 12, 0), rooms: ['АМФ2'], isPassed: false),
      Exam(subjectName: 'Оперативни системи', dateTime: DateTime(now.year, 12, 8, 9, 0), rooms: ['ЛАБ5'], isPassed: false),
      Exam(subjectName: 'Мобилни апликации', dateTime: DateTime(now.year, 12, 10, 16, 0), rooms: ['ЛАБ13'], isPassed: false),
      Exam(subjectName: 'Веб програмирање', dateTime: DateTime(now.year, 12, 12, 13, 0), rooms: ['АМФ3'], isPassed: false),
      Exam(subjectName: 'Структурно програмирање', dateTime: DateTime(now.year, 11, 7, 9, 0), rooms: ['АМФ1', 'АМФ2'], isPassed: true),
      Exam(subjectName: 'Арихитектура и организација на компјутери', dateTime: DateTime(now.year, 11, 4, 9, 0), rooms: ['АМФ1'], isPassed: true),
      Exam(subjectName: 'Линеарна алгебра', dateTime: DateTime(now.year, 12, 14, 8, 0), rooms: ['ЛАБ13'], isPassed: false),
      Exam(subjectName: 'Дискретна математика', dateTime: DateTime(now.year, 12, 16, 18, 0), rooms: ['ЛАБ138'], isPassed: false),
    ];
    data.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final exams = _exams();
    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - 223100'),
      ),


      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, i) {
          final exam = exams[i];
          return ExamCard(
            exam: exam,
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam))); },
          );
        },
      ),


        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          color: Theme.of(context).colorScheme.surface,
          child: Badge(
            largeSize: 30,
            backgroundColor: Theme.of(context).colorScheme.surface,
            textColor: Theme.of(context).colorScheme.primary,
            label: Text(
              'Вкупно испити: ${exams.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        )
    );
  }
}
