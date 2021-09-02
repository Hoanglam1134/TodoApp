import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  void showBottomSheet(BuildContext context) {
    String newTask = '';
    showModalBottomSheet(
        elevation: 2.0,
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(kPadding * 1.5),
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    newTask = value;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Add new task',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    elevation: 2,
                    backgroundColor: const Color(0xff96BB7C),
                  ),
                  onPressed: () {
                    if (newTask != '') {
                      Task task = Task(title: newTask);
                      context.read<TaskData>().addTask(task);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: kPadding),
      height: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(kBorserRadius),
          topRight: Radius.circular(kBorserRadius),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icons[0],
            size: 25,
          ),
          Icon(
            icons[1],
            size: 25,
          ),
          InkWell(
            onTap: () {
              showBottomSheet(context);
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xffA88B97),
              radius: 25,
              child: Icon(
                icons[2],
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            icons[3],
            size: 25,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ],
      ),
    );
  }
}
