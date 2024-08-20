import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/assets/color.dart';
import 'package:flutter_bloc_test/cubit/todo_cubit.dart';
import 'package:flutter_bloc_test/models/todo_model.dart';

class EditTaskPage extends StatelessWidget {
  EditTaskPage({super.key, required this.index, required this.todo});

  final TodoModel todo;
  final int index;
  late final titleController = TextEditingController(text: todo.title);
  late final detailController = TextEditingController(text: todo.subList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Text(
          "Edit Task",
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
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            TextField(
              controller: detailController,
              decoration: InputDecoration(
                hintText: "Detail",
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: appBarColor,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                        shadowColor: Colors.grey.withOpacity(0.7),
                      ),
                      onPressed: () {
                        BlocProvider.of<TodoCubit>(context).updateTodo(index,
                            title: titleController.text,
                            subList: detailController.text);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Update",
                          style: TextStyle(color: textColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: appBarColor,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                        shadowColor: Colors.grey.withOpacity(0.7),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: textColor, fontSize: 20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
