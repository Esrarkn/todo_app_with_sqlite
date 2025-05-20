import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/toDos.dart';
import 'package:todo_app/data/repo/todosDaoRepository.dart';

class HomeScreenCubit extends Cubit<List<ToDos>> {
  HomeScreenCubit() : super(<ToDos>[]);
  var todosDaoRepository = TodosDaoRepository();
  Future<void> loadTodos() async {
    var list = await todosDaoRepository.loadTodos();
    emit(list);
  }

  Future<void> search(String searchText) async {
    var list = await todosDaoRepository.search(searchText);
    emit(list);
  }
    Future<void> delete(int id) async {
   await todosDaoRepository.delete(id);
   await loadTodos();
  }
}
