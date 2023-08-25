import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:psugo/page/havecar/editsharingcar.dart';

class YourPost extends StatefulWidget {
  final String? date;
  final String? time;
  final String? start;
  final String? finish;
  final String? price;
  const YourPost({
    Key? key,
    required this.date,
    required this.time,
    required this.start,
    required this.finish,
    required this.price,
  }) : super(key: key);

  @override
  State<YourPost> createState() => _YourPostState();
}

class _YourPostState extends State<YourPost> {
  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Posts'),
      ),
      body: StreamBuilder(
        stream: usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final post =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditSharingCar(docid: post['id']),
                    ),
                  );
                },
                child: Card(
                  color: Color.fromARGB(255, 204, 232, 254),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${post['date'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Date: ${post['time'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Date: ${post['start'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Date: ${post['finish'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Date: ${post['price'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*SafeArea(
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
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Day: 27/6/2560',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Time: 14.05',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Start: โรงพยาบาลระนอง',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Finish: ธนาคารกรุงไทย',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Price: 50',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditSharingCar()));
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    ));*/
  