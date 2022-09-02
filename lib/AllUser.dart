import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_flut/services/user_services.dart';
import 'package:flutter/material.dart';

import 'model/Users.dart';

class Alluser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _User();
  }
}

class _User extends State<Alluser> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> collectionReference = UserService.readUser();
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("List of Users"),
        ),
        body: StreamBuilder(
            stream: collectionReference,
            builder:
                ( context, snapshot) {
              if (snapshot.hasData) {
         var user=snapshot.data!.docs;
  // ignore: unused_local_variable
print(user);
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    itemCount: user.length,
                    itemBuilder: ((context, index) {
                    return Text('${user[index].get('email')}');
                  }))
                  );
              }
              return Container();
            }));
  }
}
