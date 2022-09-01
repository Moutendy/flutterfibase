
import 'package:firebase_flut/model/Users.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AllUser.dart';

 Future<void> main() async{
  // bool shouldUseFirestoreEmulator = false;
  WidgetsFlutterBinding.ensureInitialized(
    
  );

 await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDN8-800nq6N1R1suxwPp3UIlTMxJEJN6E",
      appId: "1:686079275106:android:d7dfd51ecb21de05faa13b",
      messagingSenderId: "XXX",
      projectId: "fir-flutter-codelab-b3ef9",
    )
 );
  // if (shouldUseFirestoreEmulator) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controllerEmail = TextEditingController();
     final controllerPassword = TextEditingController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:Text('Authentification'),
       
      ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        TextField(
          controller:controllerEmail,
          decoration: InputDecoration( hintText: "Email",)
        ),
          TextField(
            controller:controllerPassword,
          decoration: InputDecoration( hintText: "Password")
        ),
        const SizedBox(height: 32,),
        ElevatedButton(onPressed: (){
              final user=User(password: controllerPassword.text,email: controllerEmail.text, birthday: DateTime(2022,7,8));
         
          Navigator.push(context,
            PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Alluser(
                     
                    ),
                    
                  ));
        createUser(user: user);
        }, child: Text('Create'))
    
      ],
    ),
    
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Future createUser({required User user}) async
  {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
user.id=docUser.id;
   

    final json=user.toJson();
    await docUser.set(json); 
  }
}
