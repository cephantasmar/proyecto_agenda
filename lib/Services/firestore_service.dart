import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cita_model.dart';
import '../models/empresa_model.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getEmpresas() async {
  List empresas = [];
  CollectionReference collectionReferenceEmpresas = db.collection("empresas");
  QuerySnapshot queryEmpresas = await collectionReferenceEmpresas.get();
  queryEmpresas.docs.forEach((documento){
    empresas.add(documento.data());
  });
  return empresas;
}
Future<List> getCitas(String uid) async {
  List citas = [];
  CollectionReference collectionReferenceCitas = db.collection("citas");
  QuerySnapshot queryCitas = await collectionReferenceCitas
      .where("clienteID", isEqualTo: uid)
      .get();
  queryCitas.docs.forEach((documento){
    citas.add(documento.data());
  });
  return citas;
}
Future<void> crearCita(String clienteID, String empresaID, String estado, Timestamp fecha) async {
  await FirebaseFirestore.instance.collection("citas").doc().set({
     "clienteID":clienteID,
     "empresaID":empresaID,
     "estado":estado,
     "fecha":fecha
  });
}

Future<void> crearCliente(String userId, String nombre, String email, String tipoUsuario) async {
  await FirebaseFirestore.instance.collection("usuarios").doc(userId).set({
    "nombre": nombre,
    "email": email,
    "tipo": tipoUsuario,
  });
}
Future<void> crearEmpresa(String userId, String nombre, String email, String tipoUsuario) async {
  await FirebaseFirestore.instance.collection("empresas").doc(userId).set({
    "nombre": nombre,
    "email": email,
    "tipo": tipoUsuario,
  });
}

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


// Obtener todas las empresas
  Stream<List<Empresa>> getEmpresas2() {
    return _firestore.collection('empresas').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Empresa.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

// Agendar una cita
  Future<void> agendarCita({
    required String empresaId,
    required String clienteId,
    required String fecha,
  }) async {
    await _firestore.collection('citas').add({
      'empresaId': empresaId,
      'clienteId': clienteId,
      'fecha': fecha,
      'estado': 'pendiente',
    });
  }

// Obtener citas del usuario
  Stream<List<Cita>> getCitasUsuario(String clienteId) {
    return _firestore
        .collection('citas')
        .where('clienteId', isEqualTo: clienteId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Cita.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

// Eliminar una cita
  Future<void> eliminarCita(String citaId) async {
    await _firestore.collection('citas').doc(citaId).delete();
  }












