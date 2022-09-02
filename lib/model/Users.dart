import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class User{

  late String id;
  late String email;
  late DateTime birthday;
  late String password;
User({this.id='',this.email='',required this.birthday,required this.password});
Map<String, dynamic> toJson()=>{
'id':id,
'email':email,
'birthday':birthday,
'password':password
};

static User formJson( Map<String ,dynamic> json)=>User(
  id: json['id'],
email:json['email'],birthday:(json['birthday'] as Timestamp).toDate(),password:json['password'] );

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
   id: doc['id'],
   email: doc['email'],
   birthday:doc['birthday'],
   password:doc['password'],
   
    );
  }

}

mixin FirebaseString {
}