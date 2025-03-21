import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proy_agenda/views/view_bienvenida.dart';
import 'package:proy_agenda/views/view_login.dart';
import 'package:provider/provider.dart';
import 'Services/firestore_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
     MyApp(),
    );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bienvenida(),
      theme: ThemeData(),
      title: "Calendario Corporativo",
    );
  }
}
