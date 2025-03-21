import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proy_agenda/Services/firestore_service.dart';

class CitaEmpresa extends StatelessWidget {
  DateTime? fechaSeleccionada;
  final String empresa;
  final String empresaID;
  String clienteId="";
  User? user = FirebaseAuth.instance.currentUser;





   CitaEmpresa({required this.empresa, required this.empresaID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Empresa: ${empresa}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,  // Centra el texto
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              crearCita(user!.uid, empresaID, "Ocupado", fechaSeleccionada as Timestamp);
            },
            child: Text('Elegir Fecha'),
          ),
        ],
      )
    );
  }
}

