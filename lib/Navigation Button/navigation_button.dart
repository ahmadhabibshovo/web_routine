import 'package:flutter/material.dart';
import 'package:routine/constents.dart';

class NavigateorButton extends StatefulWidget {
  final String dayName;
  const NavigateorButton({
    super.key,
    required this.dayName,
  });

  @override
  State<NavigateorButton> createState() => _NavigateorButtonState();
}

class _NavigateorButtonState extends State<NavigateorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: kContainerDecoration.copyWith(
        color: const Color(0xff292B39),
      ),

      child: Text(
        widget.dayName,
        style: kTextStyle.copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
