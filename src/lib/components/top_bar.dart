import 'package:flutter/material.dart';
import 'package:todoey/components/title_bar.dart';
import 'package:todoey/constants.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          kPadding * 2, 0, kPadding * 2, kPadding * 2),
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(kBorserRadius),
          bottomRight: Radius.circular(kBorserRadius),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TitleBar(),
          const Text(
            'Today',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusCard(
                    label: texts[0],
                    icon: iconsTopBar[0],
                    color: colorTopBar[0]),
                StatusCard(
                    label: texts[1],
                    icon: iconsTopBar[1],
                    color: colorTopBar[1]),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatusCard(
                    label: texts[2],
                    icon: iconsTopBar[2],
                    color: colorTopBar[2]),
                StatusCard(
                    label: texts[3],
                    icon: iconsTopBar[3],
                    color: colorTopBar[3]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const StatusCard(
      {Key? key, required this.label, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kPadding),
      height: 90,
      width: MediaQuery.of(context).size.width / 2 - kPadding - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
