import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/pages/complete_task_page.dart';
import 'package:flutter_bloc_test/pages/todo_page.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0);

  void updateIndex(int index) => emit(index);

  List<Widget> pages = [
    const TodoPage(),
    const CompletePage(),
  ];

  Widget getCurrentPage() => pages[state];
}
