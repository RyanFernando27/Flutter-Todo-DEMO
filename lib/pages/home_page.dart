import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

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

  void addNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Add a new Task',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 237, 237, 237)),
                ),
              ),
            ),
            FloatingActionButton(
              tooltip: 'Add',
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              onPressed: addNewTask,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
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
