import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repo/todosDaoRepository.dart';

class UpdateScreenCubit extends Cubit<void>{
  UpdateScreenCubit():super(0);
    var todosDaoRepository=TodosDaoRepository();

  
  Future<void> update(int id,String name) async{
    await todosDaoRepository.update(id, name);
  }

}