// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/birthday_list.dart';
import '../widgets/add_birthday_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday Alert Pro'),
      ),
      body: const BirthdayList(),
      floatingActionButton: const AddBirthdayFAB(),
    );
  }
}