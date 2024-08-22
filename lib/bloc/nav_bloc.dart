import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/pages/complete_task_page.dart';
import 'package:flutter_bloc_test/pages/todo_page.dart';
part 'nav_event.dart';

class NavBloc extends Bloc<NavEvent, int> {
  NavBloc() : super(0) {
    on<NavUpdated>((event, emit) {
      emit(event.index);
    });
  }

  //Bad Practice
  List<Widget> pages = [
    const TodoPage(),
    const CompletePage(),
  ];

  Widget getCurrentPage() => pages[state];
}
