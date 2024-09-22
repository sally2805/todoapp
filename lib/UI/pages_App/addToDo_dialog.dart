import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/Bloc_todo/bloc.dart';
import 'package:todoapp/Bloc_todo/event.dart';
import 'package:todoapp/model.dart';

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  TaskCategory? _selectedCategory;
  DateTime _selectedDate = DateTime.now();

  late TimeOfDay startTime;
  late TimeOfDay endTime;

  @override
  void initState() {
    _selectedDate = DateTime.now();
    startTime = TimeOfDay.now();
    endTime = TimeOfDay.now();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 8.0),
            // Task Category Selector
            TaskTypeSelector(
              onCategorySelected: (category) {
                setState(() {
                  _selectedCategory = category;
                });
              },
            ),
            SizedBox(height: 8.0),
            // Date Picker
            ListTile(
              title: Text('Select Date'),
              subtitle: Text(
                  '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              onTap: _selectDate,
            ),
            // Time Pickers

            ListTile(
              title: Text('Start Time'),
              subtitle: Text(
                  startTime != null ? startTime.format(context) : 'Select'),
              onTap: () => _selectTime(context, isStartTime: true),
            ),
            ListTile(
              title: Text('End Time'),
              subtitle:
                  Text(endTime != null ? endTime.format(context) : 'Select'),
              onTap: () => _selectTime(context, isStartTime: false),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                _descriptionController.text.isNotEmpty &&
                _selectedCategory != null) {
              final newTodo = Todo(
                title: _titleController.text,
                description: _descriptionController.text,
                category: _selectedCategory!,
                date: _selectedDate,
                startTime: startTime.format(context),
                endTime: endTime.format(context),
              );
              log(newTodo.id.toString());
              log(newTodo.title);
              log(newTodo.description);
              log(newTodo.date.toString());
              log(newTodo.startTime);
              log(newTodo.endTime);
              context.read<TodoBloc>().add(AddTodo(newTodo));
              Navigator.of(context).pop();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please fill in all fields')),
              );
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isStartTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }
}

class TaskTypeSelector extends StatefulWidget {
  final Function(TaskCategory) onCategorySelected;

  TaskTypeSelector({required this.onCategorySelected});

  @override
  _TaskTypeSelectorState createState() => _TaskTypeSelectorState();
}

class _TaskTypeSelectorState extends State<TaskTypeSelector> {
  TaskCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: TaskCategory.values.map((category) {
        return ChoiceChip(
          label: Text(category.toString().split('.').last),
          selected: _selectedCategory == category,
          onSelected: (selected) {
            setState(() {
              _selectedCategory = category;
              widget.onCategorySelected(category);
            });
          },
        );
      }).toList(),
    );
  }
}
