import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/toDos.dart';
import 'package:todo_app/ui/components/myAppBar.dart';
import 'package:todo_app/ui/cubits/homeScreenCubit.dart';
import 'package:todo_app/ui/screens/saveScreen.dart';
import 'package:todo_app/ui/screens/updateScreen.dart';
import 'package:todo_app/ui/tools/appColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeScreenCubit>().loadTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "ToDos"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox( 
                height:60 ,
                child: CupertinoSearchTextField(
                  placeholder: "Search",
                  onChanged: (searchText) {
                    context.read<HomeScreenCubit>().search(searchText);
                  },
                ),
              ),
              BlocBuilder<HomeScreenCubit, List<ToDos>>(
                builder: (context, todosList) {
                  if (todosList.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: todosList.length,
                        itemBuilder: (context, index) {
                          var todo = todosList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => UpdateScreen(todo: todo),
                                ),
                              ).then((_) {
                                context.read<HomeScreenCubit>().loadTodos();
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 70,
                                child: Card(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          todo.name,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "oswald",
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              backgroundColor: mainColor,
                                              content: Text(
                                                "Do you want to delete ${todo.name} ?",
                                                style: TextStyle(
                                                  color: textColor2,
                                                ),
                                              ),
                                              action: SnackBarAction(
                                                label: "Yes",
                                                textColor: textColor2,
                                                onPressed: () {
                                                  context
                                                      .read<HomeScreenCubit>()
                                                      .delete(todo.id);
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.clear,
                                          color: textColor1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SaveScreen()),
          );
        },
        child: Icon(Icons.add, color: textColor2),
        backgroundColor: mainColor,
      ),
    );
  }
}
