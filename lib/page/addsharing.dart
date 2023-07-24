import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Addsharing extends StatefulWidget {
  const Addsharing({super.key});

  @override
  State<Addsharing> createState() => _AddsharingState();
}

class _AddsharingState extends State<Addsharing> {
  //time
  Time _time = Time(hour: 11, minute: 30, second: 20);
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  //mediaquery
  late double screenWidth;
  late double screenHeight;

  //show date time method
  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2026))
        .then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  //create date time variable
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Image(
              image: AssetImage('images/psugo.png'),
              width: screenWidth * 0.5,
            ),
          ),
          Text(
            'Add sharing car',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              'Pick date',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    _showDatePicker();
                  },
                  child: Text(
                    'Choose Date',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Card(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(DateFormat('dd-MM-yyy').format(_dateTime)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(right: 250),
            child: Text(
              'Pick time',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        showPicker(value: _time, onChange: onTimeChanged));
                  },
                  child: Text(
                    'Choose Time',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Card(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    DateFormat('hh:mm').format(
                      DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        _time.hour,
                        _time.minute,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 280),
            child: Text(
              'Start',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 270),
            child: Text(
              'Finish',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(right: 280),
            child: Text(
              'Price',
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      )),
    );
  }
}
