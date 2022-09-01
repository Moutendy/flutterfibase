import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'model/Users.dart';

class Alluser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      Stream<QuerySnapshot> readUser() =>
    FirebaseFirestore.instance.collection('users').snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
             final Map<String, dynamic> users = snapshot.data! as Map<String, dynamic>;

            return ListView(children:[
              Text('${users['email']}')
              ,
            ]);
          } else {
            print(snapshot.hasData);
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buideUser(User user) => ListTile(
      leading: CircleAvatar(child: Text('${user.email}')),
      title: Text(user.email),
    );

