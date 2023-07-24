import 'package:flutter/material.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: Icon(
          Icons.flash_on_sharp,
          color: Colors.red,
        ),
        title: Text(title),
        subtitle: Text(message),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))
      ],
    ),
  );
}
