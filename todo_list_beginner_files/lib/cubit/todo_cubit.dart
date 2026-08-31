import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/models/todo_model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);
  addTodo(String title) {
    final todo = TodoModel(name: title, createdby: DateTime.now());
    // state.add(todo); do not used this  it changes it direcly it not polished
    final updatedaTodo = [...state, todo];
    emit(updatedaTodo);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    // TODO: implement onChange
    super.onChange(change);
    print('TodoCubit-$change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print('TodoCubit-$error');
  }
}
