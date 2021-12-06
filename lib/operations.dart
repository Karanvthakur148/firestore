import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseOperation extends StatefulWidget {
  const FirebaseOperation({Key? key}) : super(key: key);

  @override
  _FirebaseOperationState createState() => _FirebaseOperationState();
}

class _FirebaseOperationState extends State<FirebaseOperation> {
  Map? data;

  void createDb() {
    CollectionReference db = FirebaseFirestore.instance.collection('Database');
    db.add({'Name': 'Deepak', 'mobile': '8966960006'});
  }

  void fetchDb() {
    CollectionReference db = FirebaseFirestore.instance.collection('Database');
    db.snapshots().listen((snapshot) {
      setState(() {
        data = snapshot.docs[0].data() as Map?;
      });
    });
  }

  void updateDb() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Database');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference
        .update({"Name": "Raju", "mobile": "8959056592"});
  }

  void deleteDb() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Database');
    QuerySnapshot querySnapshot = await collectionReference.get();
    querySnapshot.docs[0].reference.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                createDb();
              },
              child: const Text('Create'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: fetchDb,
              //     () {
              //   fetchDb();
              // },
              child: const Text('fetch'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: updateDb,
              child: const Text('update'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: deleteDb,
              child: const Text('delete'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data!["Name"].toString(),
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(width: 5),
              Text(
                data!["mobile"].toString(),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}
