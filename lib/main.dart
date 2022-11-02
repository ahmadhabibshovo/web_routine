import 'package:flutter/material.dart';
import 'package:routine/Time/time_picker.dart';
import 'constents.dart';
import 'package:routine/Room/rooms_widgets.dart';
import 'Componant/show_input_dialog.dart';
import 'Navigation Button/navigation_button.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routine",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  int index = 0;
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 60),
        child: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 60),
          child: FloatingNavbar(
            backgroundColor: const Color(0xff292B39),
            selectedBackgroundColor: Colors.blueGrey,
            onTap: (int val) {
              setState(() {
                widget.index = val;
              });
            },
            currentIndex: widget.index,
            items: [
              FloatingNavbarItem(
                customWidget: const NavigateorButton(
                  dayName: "Saturday",
                ),
              ),
              FloatingNavbarItem(
                customWidget: const NavigateorButton(
                  dayName: "Sunday",
                ),
              ),
              FloatingNavbarItem(
                customWidget: const NavigateorButton(
                  dayName: "Monday",
                ),
              ),
              FloatingNavbarItem(
                customWidget: const NavigateorButton(
                  dayName: "Tuesday",
                ),
              ),
              FloatingNavbarItem(
                customWidget: const NavigateorButton(
                  dayName: "Wednesday",
                ),
              )
            ],
          ),
        ),
      ),
      // AppBar(
      //   actions: [
      //     Expanded(
      //       child: FloatingNavbar(
      //         backgroundColor: const Color(0xff292B39),
      //         selectedBackgroundColor: const Color.fromARGB(255, 48, 223, 179),
      //         onTap: (int val) {
      //           //returns tab id which is user tapped
      //         },
      //         currentIndex: 0,
      //         items: [
      //           FloatingNavbarItem(
      //             customWidget: NavigateorButton(
      //               dayName: "Saturday",
      //             ),
      //           ),
      //           FloatingNavbarItem(
      //             customWidget: NavigateorButton(
      //               dayName: "Sunday",
      //             ),
      //           ),
      //           FloatingNavbarItem(
      //             customWidget: NavigateorButton(
      //               dayName: "Monday",
      //             ),
      //           ),
      //           FloatingNavbarItem(
      //             customWidget: NavigateorButton(
      //               dayName: "Tuesday",
      //             ),
      //           ),
      //           FloatingNavbarItem(
      //             customWidget: NavigateorButton(
      //               dayName: "Wednesday",
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    var resultLabel = await inputDialog(
                        option: "Add Room",
                        hint: "Enter Room No",
                        context: context);
                    if (resultLabel != null) {
                      setState(() {
                        rooms.add(resultLabel);
                      });
                    }
                  },
                  onDoubleTap: () {
                    setState(() {
                      rooms.removeLast();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xff292B39),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Text('Room',
                        textAlign: TextAlign.center, style: kTextStyle),
                  ),
                ),
              ),
              Expanded(
                  flex: timesPicker.length,
                  child: Row(
                    children: timesPicker,
                  ))
            ],
          ),
          Expanded(
              child: ListView(
                  children: rooms.map((e) => RoutineRow(room: e)).toList()))
        ],
      ),
    );
  }
}
