import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocBuilder<TodoCubit, List<TodoModel>>(
        builder: (context, todos) {
          return ListView.separated(
              itemCount: todos.length,
              separatorBuilder: (_, index) => SizedBox(
                    height: 8,
                  ),
              itemBuilder: ((context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.name),
                );
              }));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-todo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
