import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/models/todo_model.dart';
part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<TodoModel>> {
  TodoBloc() : super([]) {
    on<TodoAdded>((event, emit) {
      emit(List<TodoModel>.from(state)
        ..add(TodoModel(
            title: event.todo.title,
            subList: event.todo.subList,
            isComplete: event.todo.isComplete)));
    });

    on<TodoUpdated>((event, emit) {
      final updatedTodos = List<TodoModel>.from(state);
      final existingTodo = updatedTodos[event.index];

      updatedTodos[event.index] = TodoModel(
        title:
            event.todo.title.isNotEmpty ? event.todo.title : existingTodo.title,
        subList: event.todo.subList.isNotEmpty
            ? event.todo.subList
            : existingTodo.subList,
        isComplete: event.todo.isComplete,
      );

      emit(updatedTodos);
    });

    on<TodoDeleted>((event, emit) {
      emit(List<TodoModel>.from(state)..removeAt(event.index));
    });

    on<TodoCompleted>((event, emit) {
      final updatedTodos = List<TodoModel>.from(state);
      final todo = updatedTodos[event.index];

      updatedTodos[event.index] = TodoModel(
        title: todo.title,
        subList: todo.subList,
        isComplete: true,
      );

      emit(updatedTodos);
    });
  }

  // Bad Practice
  List<TodoModel> getCompletedTodos() {
    return state.where((todos) => todos.isComplete).toList();
  }

  List<TodoModel> getNonCompleteTodos() {
    return state.where((todos) => !todos.isComplete).toList();
  }
}
