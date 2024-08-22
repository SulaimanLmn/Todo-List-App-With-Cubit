import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  List<TodoModel> getAllTodos() {
    return state;
  }

  void addTodo(
      {required String title,
      required String subList,
      required bool isComplete}) {
    emit(List<TodoModel>.from(state)
      ..add(TodoModel(title: title, subList: subList, isComplete: isComplete)));
  }

  void deleteTodo(int index) {
    emit(List<TodoModel>.from(state)..removeAt(index));
  }

  void updateTodo(int index,
      {String? title, String? subList, bool? isComplete}) {
    final updatedTodos = List<TodoModel>.from(state);
    final todo = updatedTodos[index];

    updatedTodos[index] = TodoModel(
      title: title ?? todo.title,
      subList: subList ?? todo.subList,
      isComplete: isComplete ?? todo.isComplete,
    );
    emit(updatedTodos);
  }

  void completeTodo(int index) {
    final updatedTodos = List<TodoModel>.from(state);
    final todo = updatedTodos[index];

    updatedTodos[index] = TodoModel(
      title: todo.title,
      subList: todo.subList,
      isComplete: true,
    );

    emit(updatedTodos);
  }

  List<TodoModel> getCompletedTodos() {
    return state.where((todos) => todos.isComplete).toList();
  }

  List<TodoModel> getNonCompleteTodos() {
    return state.where((todos) => !todos.isComplete).toList();
  }
}
