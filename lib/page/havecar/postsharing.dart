import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:psugo/page/havecar/yourpost.dart';

class Postsharing extends StatefulWidget {
  const Postsharing({super.key});

  @override
  State<Postsharing> createState() => _PostsharingState();
}

class _PostsharingState extends State<Postsharing> {
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController finish = TextEditingController();
  TextEditingController price = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('posts');
  //mediaquery
  late double screenWidth;
  late double screenHeight;
  //time
  Time _time = Time(hour: 11, minute: 30, second: 20);
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

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
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: () {
                ref.add({
                  'date': DateFormat('dd-MM-yyyy')
                      .format(_dateTime), // Format the date
                  'time': DateFormat('HH:mm').format(
                    DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      _time.hour,
                      _time.minute,
                    ),
                  ),
                  'start': start.text,
                  'finish': finish.text,
                  'price': price.text
                }).whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => YourPost(
                                date: '$date',
                                time: '$time',
                                start: '$start',
                                finish: '$finish',
                                price: '$price',
                              )));
                });
              },
              child: Text(
                "save",
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Image(
                  image: AssetImage('images/psugo.png'),
                  width: screenWidth * 0.4,
                ),
              ),
              Text(
                'Post sharing car',
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
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(right: 280),
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  controller: start,
                  decoration: InputDecoration(
                      hintText: 'Start',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
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
              Container(
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  controller: finish,
                  decoration: InputDecoration(
                      hintText: 'Finish',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
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
              Container(
                width: screenWidth * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  controller: price,
                  decoration: InputDecoration(
                      hintText: 'Price',
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
            ]),
          ),
        ));
  }
}
    /*screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image(
                image: AssetImage('images/psugo.png'),
                width: screenWidth * 0.4,
              ),
            ),
            Text(
              'Post sharing car',
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
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 280),
              child: Text(
                'Start',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Start',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
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
            Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Finish',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
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
            Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Price',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => YourPost())));
                },
                child: Text('Post'))
          ],
        ),
      )),
    );
  }*/

