part of 'todo_bloc.dart';

class TodoEvent {}

class TodoAdded extends TodoEvent {
  TodoModel todo;

  TodoAdded({required this.todo});
}

class TodoUpdated extends TodoEvent {
  TodoModel todo;
  int index;

  TodoUpdated({required this.index, required this.todo});
}

class TodoDeleted extends TodoEvent {
  int index;
  TodoDeleted({required this.index});
}

class TodoCompleted extends TodoEvent {
  int index;
  TodoCompleted({required this.index});
}
