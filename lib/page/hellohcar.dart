import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/addsharing.dart';

class HelloHcar extends StatefulWidget {
  const HelloHcar({super.key});

  @override
  State<HelloHcar> createState() => _HelloHcarState();
}

class _HelloHcarState extends State<HelloHcar> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Hello, THIS IS NAME FB',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image(
                    image: AssetImage('images/psugo.png'),
                    width: screenWidth * 0.2,
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Image(
                  image: AssetImage('images/psugo.png'),
                  width: screenWidth * 0.58,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'Call with friend',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 110),
              child: Text(
                'Don\'t sharing car today',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 250),
              child: Text(
                'Manage',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Addsharing()));
              },
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 40, right: 40), //ระยะห่างจากขอบจอ
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add sharing car',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 40, right: 40), //ระยะห่างจากขอบจอ
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.paste_outlined,
                        color: Colors.blue,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Your post',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 70,
                margin: EdgeInsets.only(left: 40, right: 40), //ระยะห่างจากขอบจอ
                child: Card(
                  child: Row(
                    children: [
                      Icon(
                        Icons.nature_people_rounded,
                        color: Colors.blue,
                        size: 50,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Go with you',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
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
