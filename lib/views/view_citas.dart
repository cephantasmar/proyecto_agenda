import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proy_agenda/Services/firestore_service.dart';

class ViewCitas extends StatefulWidget {
  const ViewCitas({super.key});

  @override
  State<ViewCitas> createState() => _ViewCitasState();
}

class _ViewCitasState extends State<ViewCitas> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Citas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: getCitas(user!.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar citas"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No tienes citas programadas",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var cita = snapshot.data![index];
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Icon(Icons.calendar_today, color: Colors.blueAccent),
                  title: Text(
                    "Fecha: ${cita["fecha"]}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Empresa: ${cita["empresa"]}",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueAccent),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
