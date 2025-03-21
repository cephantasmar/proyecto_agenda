import 'package:flutter/material.dart';
import 'package:proy_agenda/Services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'CitaEmpresa.dart';

class ViewEmpresas extends StatefulWidget {
  const ViewEmpresas({super.key});

  @override
  State<ViewEmpresas> createState() => _ViewEmpresasState();
}

class _ViewEmpresasState extends State<ViewEmpresas> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Empresas"),
      ),
      body: FutureBuilder(
        future: getEmpresas(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Si los datos están disponibles, mostramos una lista
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                // Obtenemos la empresa actual
                var empresa = snapshot.data?[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.business, color: Colors.blue),
                    title: Text(
                      empresa["nombre"],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      empresa["horario"] ?? "Descripción no disponible",
                      style: TextStyle(fontSize: 14),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      print(empresa["nombre"]);


                      Navigator.push(
                        context,
                        MaterialPageRoute(

                          builder: (context) => CitaEmpresa(empresa: empresa["nombre"], detalle: empresa["detalle"], direccion: empresa["detalle"], horario: empresa["horario"], email: empresa["email"], telefono: empresa["telefono"]),

                        ),
                      );
                    },

                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: CircularProgressIndicator(), // Mientras se cargan los datos
            );
          }
        },
      ),
    );
  }
}
