// lib/widgets/birthday_list.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/birthday_model.dart';

class BirthdayList extends StatelessWidget {
  const BirthdayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BirthdayProvider>(
      builder: (context, birthdayProvider, child) {
        if (birthdayProvider.birthdays.isEmpty) {
          return const Center(
            child: Text('No birthdays added yet!'),
          );
        }
        return ListView.builder(
          itemCount: birthdayProvider.birthdays.length,
          itemBuilder: (context, index) {
            final birthday = birthdayProvider.birthdays[index];
            return ListTile(
              title: Text(birthday.name),
              subtitle: Text(
                '${birthday.relation} - ${_formatDate(birthday.date)}',
              ),
              trailing: Text('${_getDaysUntil(birthday.date)} days'),
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  int _getDaysUntil(DateTime date) {
    final now = DateTime.now();
    final birthday = DateTime(now.year, date.month, date.day);
    final difference = birthday.difference(now).inDays;
    return difference < 0 ? difference + 365 : difference;
  }
}
