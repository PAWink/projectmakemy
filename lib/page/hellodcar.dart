import 'package:flutter/material.dart';

class HelloDcar extends StatefulWidget {
  const HelloDcar({super.key});

  @override
  State<HelloDcar> createState() => _HelloDcarState();
}

class _HelloDcarState extends State<HelloDcar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
    );
  }
}
