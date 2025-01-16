// lib/widgets/add_birthday_fab.dart
import 'package:flutter/material.dart';
import '../screens/add_birthday_screen.dart';

class AddBirthdayFAB extends StatelessWidget {
  const AddBirthdayFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddBirthdayScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}