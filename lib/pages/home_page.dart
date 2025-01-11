import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Learn Flutter', true],
    ['OOP exam', true],
    ['Buy Code', false],
  ];
  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];

      ///Toggle
    });
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: todoList.isEmpty
          ? const Center(
              child: Text("Empty"),
            )
          : ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (BuildContext context, index) {
                return TodoList(
                  taskName: todoList[index][0],
                  taskCompleted: todoList[index][1],
                  onChanged: (value) => checkBoxChanged(index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
