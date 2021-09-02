import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TitleBar extends StatelessWidget {
  final dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            DateFormat('MMM dd, yyyy').format(dateTime),
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          Icons.date_range,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
        ),
        const Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
      ],
    );
  }
}
