import 'package:flutter/material.dart';
import 'package:psugo/page/choose.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        topLogo(),
        underInformation(context),
      ])),
    );
  }

  Flexible underInformation(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(30), //ย่อหน้าใช้ padding
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'example@gmail.com',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          'Or',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Choose()));
                          },
                          child: Text(
                            'Register a new account',
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: buttonLogin(context),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buttonLogin(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login()));
      },
      child: Text(
        'Login',
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.greenAccent,
        minimumSize: Size(80, 45),
      ),
    );
  }

  Flexible topLogo() {
    return Flexible(
      flex: 1,
      child: Container(
        child: Image(
          image: AssetImage('images/psugo.png'),
          width: 240,
        ),
      ),
    );
  }
}
