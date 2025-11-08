import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('dd.MM.yyyy').format(exam.dateTime);
    final timeStr = DateFormat('HH:mm').format(exam.dateTime);
    final isFuture = exam.dateTime.isAfter(DateTime.now());
    final bg = exam.isPassed ? Colors.green.shade50 : (isFuture ? Colors.blue.shade50 : Colors.grey.shade200);
    final border = exam.isPassed ? Colors.green : (isFuture ? Colors.blue : Colors.grey);

    return Card(
      color: bg,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: border, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(exam.subjectName, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),

              Row(
                children: [
                  const Icon(Icons.event, size: 20),
                  const SizedBox(width: 8),
                  Text('$dateStr • $timeStr'),
                ],
              ),
              const SizedBox(height: 6),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.room, size: 20),
                  const SizedBox(width: 8),
                  Expanded(child: Text(exam.rooms.join(', '))),
                ],
              ),

              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(exam.isPassed ? Icons.check_circle : Icons.schedule, size: 20, color: border),
                  const SizedBox(width: 8),
                  Text(exam.isPassed ? 'Поминат испит' : (isFuture ? 'Иден испит' : 'Пројден термин')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
