import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey/components/bottom_bar.dart';
import 'package:todoey/components/task_list.dart';
import 'package:todoey/components/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            TaskList(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopBar(),
                BottomBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
