import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/todosDaoRepository.dart';

class SaveScreenCubit extends Cubit<void>{
  SaveScreenCubit():super(0);
    var todosDaoRepository=TodosDaoRepository();

  Future<void>save(String name) async{
await todosDaoRepository.save(name);
  }
}