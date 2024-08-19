import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/assets/color.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
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
            const TextField(
              decoration: InputDecoration(
                hintText: "Title",
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            const TextField(
              decoration: InputDecoration(
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
              onPressed: () {},
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
