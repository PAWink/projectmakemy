import 'package:flutter/material.dart';

class YourPost extends StatefulWidget {
  const YourPost({super.key});

  @override
  State<YourPost> createState() => _YourPostState();
}

class _YourPostState extends State<YourPost> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Center(
              heightFactor: 5,
              child: Text(
                'Your post',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 0.8,
            child: Card(
              color: Color.fromARGB(255, 204, 232, 254),
              child: Text(
                'data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
