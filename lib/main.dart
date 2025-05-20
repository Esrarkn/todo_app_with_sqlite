import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/ui/cubits/homeScreenCubit.dart';
import 'package:todo_app/ui/cubits/saveScreenCubit.dart';
import 'package:todo_app/ui/cubits/updateScreenCubit.dart';
import 'package:todo_app/ui/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(create:(context)=>SaveScreenCubit()),
        BlocProvider(create:(context)=>UpdateScreenCubit()),
        BlocProvider(create:(context)=>HomeScreenCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomeScreen()
      ),
    );
  }
}