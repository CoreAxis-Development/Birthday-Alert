// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'models/birthday_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BirthdayProvider(),
      child: const BirthdayAlertPro(),
    ),
  );
}

class BirthdayAlertPro extends StatelessWidget {
  const BirthdayAlertPro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Alert Pro',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}


