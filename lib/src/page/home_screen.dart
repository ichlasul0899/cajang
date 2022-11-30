import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    // Create a new user with a first and last name

    return Scaffold(
      appBar: AppBar(
        title: Text("Catatan Keuangan"),
      ),
      body: ListView(
        children: [
          // View Data Here
          // 1x get data

          // FutureBuilder<QuerySnapshot>(
          //     future:  db.collection("users").get(),
          //     builder: (_, snapshot) {
          //       if(snapshot.hasData){
          //         print(snapshot.data?.docs);
          //         return Column(
          //           children: snapshot.data!.docs
          //               .map((e) => Text("${e.get('first')} ${e.get('last')}") ).toList(),
          //         );
          //         // return Column(
          //         //   children: snapshot.data!.docs.map((e) => Text("Name ${e.data()['first']}") ).toList(),
          //         // );
          //       } else {
          //         return Text("Loading");
          //       }
          //     }
          // ),
          StreamBuilder(
              stream: db.collection("users").snapshots(),
              builder: (_, snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: snapshot.data!.docs.map((e)=> Text("${e.data()['first']}")).toList(),
                  );
                } else {
                  return Text("Loading");
                }
              }
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                print("add data");
                final user = <String, dynamic>{
                  "first": "Ichlasul",
                  "last": "Amal",
                  "born": 2397
                };

                // Add a new document with a generated ID
                db.collection("users").add(user).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));

              },
              child: Text("Add Data")
              ,),
          ),

        ],
      ),
    );
  }
}
