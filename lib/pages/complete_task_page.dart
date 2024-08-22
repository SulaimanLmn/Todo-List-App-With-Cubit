import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/assets/color.dart';
import 'package:flutter_bloc_test/bloc/todo_bloc.dart';
import 'package:flutter_bloc_test/cubit/todo_cubit.dart';
import 'package:flutter_bloc_test/models/todo_model.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Completed Task",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appBarColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
        width: double.infinity,
        child: BlocBuilder<TodoCubit, List<TodoModel>>(
          builder: (context, todos) {
            final completedTodo =
                BlocProvider.of<TodoBloc>(context).getCompletedTodos();
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: 82,
                    decoration: BoxDecoration(
                      color: textColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 3)),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                completedTodo[index].title,
                                style: TextStyle(color: todoTitleColor),
                              ),
                              const Spacer(),
                              Text(completedTodo[index].subList),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemCount: completedTodo.length);
          },
        ),
      ),
    );
  }
}
