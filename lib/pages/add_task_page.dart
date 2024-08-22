import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/assets/color.dart';
import 'package:flutter_bloc_test/bloc/todo_bloc.dart';
import 'package:flutter_bloc_test/models/todo_model.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final titleController = TextEditingController();
  final detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(
          "Add Task",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        width: double.infinity,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                hintText: "Detail",
              ),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: appBarColor,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
                shadowColor: Colors.grey.withOpacity(0.7),
              ),
              onPressed: () {
                BlocProvider.of<TodoBloc>(context).add(
                  TodoAdded(
                    todo: TodoModel(
                        title: titleController.text,
                        subList: detailController.text,
                        isComplete: false),
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 155, vertical: 10),
                child: Text(
                  "ADD",
                  style: TextStyle(color: textColor, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
