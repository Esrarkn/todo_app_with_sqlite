
import 'package:todo_app/data/entity/toDos.dart';
import 'package:todo_app/data/sqlite/database_helper.dart';

class TodosDaoRepository {
  Future<void> save(String name) async {
    var db=await DatabaseHelper.veritabaniErisim();

    var newTodo=Map<String, dynamic>();
    newTodo["name"]=name;

    await db.insert("toDos", newTodo);

  }

  Future<void> update(int id, String name) async {
        var db=await DatabaseHelper.veritabaniErisim();

    var updatedTodo=Map<String, dynamic>();
    updatedTodo["name"]=name;

    await db.update("toDos", updatedTodo,where: "id=?", whereArgs: [id]);
  }

  Future<List<ToDos>> loadTodos() async {
    var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM toDos");

    return List.generate(list.length, (indeks) {
      var row = list[indeks];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name,);
    });
  }

  Future<List<ToDos>> search(String searchText) async {
   var db = await DatabaseHelper.veritabaniErisim();

    List<Map<String, dynamic>> list = await db.rawQuery("SELECT * FROM toDos WHERE name LIKE '%$searchText%' ");

    return List.generate(list.length, (indeks) {
      var row = list[indeks];
      var id = row["id"];
      var name = row["name"];
      return ToDos(id: id, name: name);
    });
    
  }

  Future<void> delete(int id) async {
 var db= await DatabaseHelper.veritabaniErisim();
  await db.delete("toDos", where: "id=?", whereArgs:[id]);
   }
}
