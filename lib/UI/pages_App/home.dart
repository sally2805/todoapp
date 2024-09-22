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
          
          ])
        );
  }
}
