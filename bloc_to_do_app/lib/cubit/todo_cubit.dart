import 'package:bloc_to_do/model/to_do_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  addTodo(String title) {
    if (title.isEmpty) {
      addError("title is empty");
      return;
    }
    final todo = Todo(name: title, createdAt: DateTime.now());
    // state.add(todo);
    // emit([...state]);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print(error);
    super.onError(error, stackTrace);
  }
}
