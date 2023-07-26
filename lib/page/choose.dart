import 'package:flutter/material.dart';
import 'package:psugo/page/dcar.dart';
import 'package:psugo/page/hcar.dart';

class Choose extends StatefulWidget {
  const Choose({super.key});

  @override
  State<Choose> createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  String? vehicle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('images/psugo.png'),
                width: 240,
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.blue),
              ),
              Container(
                margin: EdgeInsets.all(60), //ย่อหน้า
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'This is an application for car sharing. Please select if you have a car or don\'t have a car.',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Choose',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    RadioListTile(
                      title: Text(
                        'don\'t have car',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'don\'t have car',
                      groupValue: vehicle,
                      onChanged: (value) {
                        setState(() {
                          vehicle = value;
                        });
                      },
                      activeColor: Colors.white,
                      selectedTileColor: Colors.white,
                    ),
                    RadioListTile(
                      title: Text(
                        'have car',
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'have car',
                      groupValue: vehicle,
                      onChanged: (value) {
                        setState(() {
                          vehicle = value;
                        });
                      },
                      activeColor: Colors.white,
                      selectedTileColor: Colors.white,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text(
                          'Continue',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        onPressed: () {
                          if (vehicle == 'don\'t have car') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dcar()));
                          } else if (vehicle == 'have car') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const Hcar())));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(80, 45),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
        backgroundColor: Color.fromARGB(255, 58, 164, 245));
  }
}
