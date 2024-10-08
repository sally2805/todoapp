import 'package:todoapp/model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoFilteredByDate extends TodoState {
  final List<Todo> todos;

  TodoFilteredByDate(this.todos);
}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
}

class TodoError extends TodoState {
  final String message;

  TodoError(this.message);
}
