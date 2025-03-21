import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proy_agenda/Services/firestore_service.dart';
import 'package:proy_agenda/views/view_bienvenida.dart';
import 'package:proy_agenda/views/view_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../views/view_login.dart';


class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //CREAR UNA CUENTA

  Future<void> signup({
    required String email,
    required String password,
    required String nombre,
    required String tipoUsuario,
    required BuildContext context



  }) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String uid = userCredential.user!.uid;

      if(tipoUsuario == "Cliente"){
        crearCliente(uid, nombre, email, tipoUsuario);
      }else{
        crearEmpresa(uid, nombre, email, tipoUsuario);
      }

      // Guardar datos en Firestore





      await Future.delayed(const Duration(seconds: 1));


      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>ViewLogin())
      );

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'La contraseña ingresada es muy debil';
      } else if (e.code == 'email-already-in-use') {
        message = 'Una cuenta con este correo ya existe';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
    catch(e){

    }


  }

  //INICIAR SESION
  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context
  }) async {

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );


      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context)=>ViewMenu())
      );

    } on FirebaseAuthException catch(e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Ninguna usuario encontrada para ese correo electrónico.';
      } else if (e.code == 'invalid-credential') {
        message = 'Contraseña incorrecta';
      }
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 14.0,

      );
    }
    catch(e){

    }

  }
  Future<void> signout({
    required BuildContext context
  }) async {

    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>Bienvenida()
        )
    );
  }


}