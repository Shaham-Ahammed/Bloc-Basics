import 'package:bloc_to_do/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = BlocProvider.of<TodoCubit>(context);
    final TextEditingController titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("add to do"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                todo.addTodo(titleController.text);
                Navigator.pop(context);
              },
              child: Text("add to do"))
        ],
      )),
    );
  }
}
