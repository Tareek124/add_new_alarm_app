// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'My App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        backgroundColor: Color(0xffe3e5e8),
        body: Container(
          child: MyAppStateful(),
          color: Colors.white60,
        ),
      ),
    );
  }
}

class MyAppStateful extends StatefulWidget {
  const MyAppStateful({Key? key}) : super(key: key);

  @override
  State<MyAppStateful> createState() => _MyAppStatefulState();
}

class _MyAppStatefulState extends State<MyAppStateful> {
  TextEditingController alarmHours = TextEditingController();
  TextEditingController alarmMinutes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: const [
          Colors.yellow,
          Colors.red,
          Colors.indigo,
          Colors.teal,
        ],
      )),
      child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          padding: EdgeInsets.only(top: 120, right: 30, left: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image(image: AssetImage('assets/images/alarm4.png')),
              ),
              Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Text(
                    'My Alarm',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'normal',
                        fontWeight: FontWeight.w500,
                        fontSize: 35),
                  )),
              Column(
                children: [
                  TextField(
                    controller: alarmHours,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)),
                      hintText: 'hour',
                    ),
                  ),
                  SizedBox(height: 25),
                  TextField(
                    controller: alarmMinutes,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'minutes',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.teal)))),
                        child: const Text(
                          'Set Alarm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: () {
                          FlutterAlarmClock.createAlarm(
                              int.parse(alarmHours.text),
                              int.parse(alarmMinutes.text));
                        },
                      )),
                  Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 25),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.teal),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.teal)))),
                        child: const Text(
                          'Show Alarm',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        onPressed: () {
                          FlutterAlarmClock.showAlarms();
                        },
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
