import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/entity/toDos.dart';
import 'package:todo_app/ui/components/myAppBar.dart';
import 'package:todo_app/ui/cubits/homeScreenCubit.dart';
import 'package:todo_app/ui/cubits/updateScreenCubit.dart';
import 'package:todo_app/ui/screens/homeScreen.dart';
import 'package:todo_app/ui/tools/appColors.dart';
class UpdateScreen extends StatefulWidget {
  ToDos todo;
  UpdateScreen({required this.todo});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var tfName=TextEditingController();

  @override
  void initState() {
    tfName.text=widget.todo.name;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Update Screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                controller: tfName,
                decoration: InputDecoration(hintText: widget.todo.name),
              ),
            ),
            SizedBox(
              height: screenHeight / 15,
              width: screenWidth / 2,
              child: ElevatedButton(
                onPressed: () {
                  context.read<UpdateScreenCubit>().update(widget.todo.id, tfName.text);
                   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Text("UPDATE", style: TextStyle(color: textColor2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
