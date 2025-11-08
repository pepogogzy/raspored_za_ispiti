import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String remaining() {
    final now = DateTime.now();
    Duration diff = exam.dateTime.difference(now);
    final negative = diff.isNegative;
    diff = diff.abs();

    final days = diff.inDays;
    final hours = diff.inHours % 24;

    final base = '$days дена, $hours часа';
    return negative ? 'Поминато: $base' : 'Преостанува: $base';
  }

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('EEEE, dd MMM yyyy', 'mk').format(exam.dateTime);
    final timeStr = DateFormat('HH:mm').format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(title: const Text('Детали за испит')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exam.subjectName, style: Theme.of(context).textTheme.headlineSmall), // title
            const SizedBox(height: 12),

            Row(children: [const Icon(Icons.event), const SizedBox(width: 8), Text('$dateStr • $timeStr')]), // time
            const SizedBox(height: 8),

            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [ // room
              const Icon(Icons.room),
              const SizedBox(width: 8),
              Expanded(child: Text(exam.rooms.join(', '))),
            ]),

            const SizedBox(height: 8), // time remaining
            Row(children: [
              const Icon(Icons.timer_outlined),
              const SizedBox(width: 8),
              Text(remaining()),
            ]),
          ],
        ),
      ),
    );
  }
}
