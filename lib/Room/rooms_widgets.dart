import 'package:flutter/material.dart';
import 'package:routine/constents.dart';
import 'package:routine/Componant/show_input_dialog.dart';

class SatRoom extends StatefulWidget {
  SatRoom({
    super.key,
    this.room,
  });
  String? room;
  @override
  State<SatRoom> createState() => _SatRoomState();
}

class _SatRoomState extends State<SatRoom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () async {
          var resultLabel = await inputDialog(
              option: "Add Class", hint: "Enter Class Info", context: context);
          if (resultLabel != null) {
            setState(() {
              widget.room = resultLabel;
            });
          }
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: kContainerDecoration,
          child: widget.room.toString() == "null"
              ? const Text("")
              : Text(
                  widget.room.toString(),
                  style: kTextStyle,
                  textAlign: TextAlign.center,
                ),
        ),
      ),
    );
  }
}

class RoutineRow extends StatefulWidget {
  const RoutineRow({super.key, required this.room});
  final String room;
  static addRoom(String roomName) {}

  @override
  State<RoutineRow> createState() => _RoutineRowState();
}

class _RoutineRowState extends State<RoutineRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SatRoom(room: widget.room),
        SatRoom(),
        SatRoom(),
        SatRoom(),
        SatRoom(),
        SatRoom(),
        SatRoom(),
        SatRoom(),
        SatRoom(),
      ],
    );
  }
}

List<String> rooms = [
  "CSE102N",
  "CSE103",
  "CSE104",
  "CSE105",
  "CSE207",
  "CSE209",
  "GED227",
  "EEE234",
  "CSE103",
  "GED104",
];
