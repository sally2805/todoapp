import 'dart:async';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Bloc_todo/bloc.dart';
import 'package:todoapp/Bloc_todo/state.dart';


class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DateTime _dateSelcetion = DateTime.now();
  DateTime data_time_Now  = DateTime.now();

  List<String> month=['','Jan','Feb','Mar','April','May','June','July','Aug','Sep','Oct','Nov','Dec'];
 
  String _formatTime(String time) {
    final timeParts = time.split(":");
    final hour = int.parse(timeParts[0]);
    final minute = timeParts[1];

    // Determine AM or PM
    final period = hour >= 12 ? 'PM' : 'AM';

    // Convert hour to 12-hour format
    final formattedHour = hour > 12
        ? hour - 12
        : hour == 0
            ? 12
            : hour;

    return '$formattedHour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(title: Text('${DateFormat('EEEE').format(_dateSelcetion)},${_dateSelcetion.day} ${month[_dateSelcetion.month]} ${_dateSelcetion.year}'),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            height: 150,
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: _dateSelcetion,
              selectionColor: Colors.blue,
              selectedTextColor: Colors.white,
              onDateChange: (selectedDate) {
                setState(() {
                  _dateSelcetion= selectedDate;
                });

                // context.read<TodoBloc>().add(FilterTodosByDate(dateTime));
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is TodoFilteredByDate) {
                  final todos = state.todos;
                  return ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Description: ${todo.description}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Category: ${todo.category.toString().split('.').last}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Date: ${todo.date.day}/${todo.date.month}/${todo.date.year}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(_formatTime(
                                  todo.startTime)), // Format start time
                              Text(
                                  _formatTime(todo.endTime)), // Format end time
                            ],
                          ),
                        ),
                      );

                     
                    },
                  );
                } else if (state is TodoError) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('Select a date to see tasks'));
                }
              },
            ),
          )
          
          ])
        );
  }
}
