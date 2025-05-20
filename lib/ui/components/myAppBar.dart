import 'package:flutter/material.dart';
import 'package:todo_app/ui/tools/appColors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
 String title;
 MyAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: textColor2, fontSize: 26, fontFamily: "Spinnaker"),
      ),
      centerTitle: true,
      backgroundColor: mainColor,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
