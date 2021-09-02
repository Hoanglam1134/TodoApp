import 'package:flutter/material.dart';
import 'package:todoey/model/task_data.dart';
import 'screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'To do list',
        theme: ThemeData(
          backgroundColor: const Color(0xffF5F7FB),
          primaryColor: Colors.white,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
