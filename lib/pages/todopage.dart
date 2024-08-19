import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/assets/color.dart';
import 'package:flutter_bloc_test/pages/addtaskpage.dart';
import 'package:flutter_bloc_test/pages/edit_task_page.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      appBar: AppBar(
        title: Text(
          "TODO APP",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
        ),
        backgroundColor: appBarColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.calendar_today,
              size: 33,
              color: textColor,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
        width: double.infinity,
        child: ListView.separated(
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
                            "TODO LIST",
                            style: TextStyle(color: todoTitleColor),
                          ),
                          const Spacer(),
                          const Text("TODO SUB LIST")
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 25,
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditTaskPage(),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: iconColor,
                              ),
                            ),
                            Icon(
                              Icons.delete_outline,
                              color: iconColor,
                            ),
                            Icon(
                              Icons.check_box_outlined,
                              color: iconColor,
                            )
                          ],
                        ),
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
            itemCount: 5),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddTaskPage(),
              ),
            );
          },
          shape: const CircleBorder(),
          elevation: 3,
          backgroundColor: appBarColor,
          child: Icon(
            Icons.add,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
