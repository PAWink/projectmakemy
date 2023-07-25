import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
                  height: 20,
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
                            'Student',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          SizedBox(
                            height: 10,
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
                            'Price: 50 Bath',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
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
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(255, 204, 232, 254),
          color: Colors.blue,
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(Icons.chat_bubble_outline_outlined),
            Icon(Icons.home_rounded),
            Icon(Icons.settings)
          ],
        ));
  }
}
