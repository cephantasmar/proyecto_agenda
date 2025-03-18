import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:proy_agenda/views/view_bienvenida.dart';

void main() {
  runApp(const MyApp());
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
