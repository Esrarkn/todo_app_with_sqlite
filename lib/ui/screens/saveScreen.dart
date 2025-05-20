import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/components/myAppBar.dart';
import 'package:todo_app/ui/cubits/homeScreenCubit.dart';
import 'package:todo_app/ui/cubits/saveScreenCubit.dart';
import 'package:todo_app/ui/screens/homeScreen.dart';
import 'package:todo_app/ui/tools/appColors.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  var tfName = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;

    return Scaffold(
      appBar: MyAppBar(title: "Save Screen"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                controller: tfName,
                decoration: InputDecoration(hintText: "Name"),
              ),
            ),
            SizedBox(
              height: screenHeight / 15,
              width: screenWidth / 2,
              child: ElevatedButton(
                onPressed: () {
                  context.read<SaveScreenCubit>().save(tfName.text);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: mainColor),
                child: Text("SAVE", style: TextStyle(color: textColor2)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
