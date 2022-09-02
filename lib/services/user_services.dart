// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
final FirebaseFirestore  _firestore =FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('users');
class UserService{

 static Stream<QuerySnapshot> readUser()  {
    CollectionReference notesItemCollection =_Collection;

    return notesItemCollection.snapshots();
  }
}