import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/donthavecar/transaction_d.dart';

class HelloDcar extends StatefulWidget {
  const HelloDcar({super.key});

  @override
  State<HelloDcar> createState() => _HelloDcarState();
}

class _HelloDcarState extends State<HelloDcar> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
              SizedBox(
                height: 10,
              ),
              Text(
                'List Sharing car today',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Image(
                          image: AssetImage('images/psugo.png'),
                          width: screenWidth * 0.3,
                        ),
                        Text(
                          'haveCar',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Student-CoE',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Start: โรงอาหาร - Finish: ร้านขายของชำ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 98, 0)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Date: 12/06/2023',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Time: 14.20 น.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Price: 50 Bath',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransactionD(),
                              ));
                            },
                            child: Text(
                              'Book',
                              style: TextStyle(fontSize: 20),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 204, 232, 254),
    );
  }
}
