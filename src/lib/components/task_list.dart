import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, value, child) {
        List<Task> data = value.taskList;
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: kPadding),
            padding: const EdgeInsets.only(
                top: kPadding * 3, left: kPadding, right: kPadding),
            height: MediaQuery.of(context).size.height / 2 + 40,
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                CountTask(),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: ListTile(
                          onLongPress: () {
                            value.delTask(data[index]);
                          },
                          leading: Checkbox(
                            value: data[index].isDone,
                            onChanged: (isDone) {
                              value.updateTask(data[index]);
                            },
                          ),
                          title: Text(
                            data[index].title,
                            style: TextStyle(
                              decoration: data[index].isDone == true
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CountTask extends StatelessWidget {
  const CountTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Text(
            context.watch<TaskData>().taskList.length.toString() + ' tasks  ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffE9AC7F),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Spacer(),
          const Text(
            'All Tasks ',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.expand_more_outlined,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
