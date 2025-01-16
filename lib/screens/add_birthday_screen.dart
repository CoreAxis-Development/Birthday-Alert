// lib/screens/add_birthday_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/birthday_model.dart';

class AddBirthdayScreen extends StatefulWidget {
  const AddBirthdayScreen({super.key});

  @override
  State<AddBirthdayScreen> createState() => _AddBirthdayScreenState();
}

class _AddBirthdayScreenState extends State<AddBirthdayScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  int _reminderDays = 7;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveBirthday() {
    if (_formKey.currentState!.validate()) {
      final birthday = Birthday(
        name: _nameController.text,
        date: _selectedDate,
        relation: _relationController.text,
        reminderDays: _reminderDays,
      );

      Provider.of<BirthdayProvider>(context, listen: false).addBirthday(birthday);
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _relationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Birthday'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _relationController,
                decoration: const InputDecoration(
                  labelText: 'Relation',
                  icon: Icon(Icons.people),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your relation';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: const Text('Birthday Date'),
                subtitle: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                ),
                onTap: () => _selectDate(context),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.notification_important),
                title: const Text('Reminder Days Before'),
                trailing: DropdownButton<int>(
                  value: _reminderDays,
                  items: [1, 3, 5, 7, 14, 30]
                      .map((days) => DropdownMenuItem(
                    value: days,
                    child: Text('$days days'),
                  ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _reminderDays = value;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _saveBirthday,
                icon: const Icon(Icons.save),
                label: const Text('Save Birthday'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}