import 'package:flutter/material.dart';
import 'package:routine/constents.dart';

List<Widget> timesPicker = [
  TimePicker(
      time1: const TimeOfDay(hour: 09, minute: 00),
      time2: const TimeOfDay(hour: 10, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 10, minute: 00),
      time2: const TimeOfDay(hour: 11, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 11, minute: 00),
      time2: const TimeOfDay(hour: 12, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 12, minute: 00),
      time2: const TimeOfDay(hour: 13, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 13, minute: 00),
      time2: const TimeOfDay(hour: 14, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 14, minute: 00),
      time2: const TimeOfDay(hour: 15, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 15, minute: 00),
      time2: const TimeOfDay(hour: 16, minute: 00)),
  TimePicker(
      time1: const TimeOfDay(hour: 16, minute: 00),
      time2: const TimeOfDay(hour: 17, minute: 00)),
];
addWidget({required TimeOfDay timeAdd}) {
  timesPicker.add(
    TimePicker(time1: timeAdd, time2: timeAdd),
  );
}

class TimePicker extends StatefulWidget {
  TimePicker({super.key, required this.time1, required this.time2});
  TimeOfDay time1;
  TimeOfDay time2;
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: kContainerDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                showTimePicker(context: context, initialTime: widget.time1)
                    .then((value) {
                  setState(() {
                    widget.time1 = value!;
                  });
                });
              },
              child: Text(
                  widget.time1.format(context).toString().replaceAll(" ", ""),
                  textAlign: TextAlign.center,
                  style: kTextStyle),
            ),
            const Text("-", textAlign: TextAlign.center, style: kTextStyle),
            InkWell(
              onTap: () {
                showTimePicker(context: context, initialTime: widget.time2)
                    .then((value) {
                  setState(() {
                    widget.time2 = value!;
                  });
                });
              },
              child: Text(
                widget.time2.format(context).toString().replaceAll(" ", ""),
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
