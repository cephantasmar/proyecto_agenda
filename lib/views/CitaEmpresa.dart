import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proy_agenda/Services/firestore_service.dart';

class CitaEmpresa extends StatefulWidget {
  final String empresa;
  final String detalle;
  final String direccion;
  final String horario;
  final String email;
  final String telefono;

  CitaEmpresa({
    required this.empresa,
    required this.detalle,
    required this.direccion,
    required this.horario,
    required this.email,
    required this.telefono,
  });

  @override
  _CitaEmpresaState createState() => _CitaEmpresaState();
}

class _CitaEmpresaState extends State<CitaEmpresa> {
  DateTime? fechaSeleccionada;
  TimeOfDay? horaSeleccionada;
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (fecha != null) {
      setState(() {
        fechaSeleccionada = fecha;
      });
    }
  }

  Future<void> _seleccionarHora(BuildContext context) async {
    final TimeOfDay? hora = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (hora != null) {
      setState(() {
        horaSeleccionada = hora;
      });
    }
  }

  void _confirmarCita() {
    if (fechaSeleccionada == null || horaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecciona fecha y hora')),
      );
      return;
    }

    // Convertir la fecha y hora seleccionada a String
    DateTime fechaHora = DateTime(
      fechaSeleccionada!.year,
      fechaSeleccionada!.month,
      fechaSeleccionada!.day,
      horaSeleccionada!.hour,
      horaSeleccionada!.minute,
    );
    String fechaString =
        "${fechaHora.day}/${fechaHora.month}/${fechaHora.year} ${fechaHora.hour}:${fechaHora.minute.toString().padLeft(2, '0')}";

    // Llamar a la función crearCita
    String clienteID = user?.uid ?? "JoWjCB5CRjTtyiZJYZM6arU6g6J3";
    String empresaID = widget.empresa; // Ajusta esto si el ID real de la empresa es otro
    String estado = "Ocupado";

    crearCita(clienteID, empresaID, estado, fechaString);

    // Mostrar mensaje de éxito
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cita agendada para el $fechaString')),
    );
  }

  void crearCita(String clienteID, String empresaID, String estado, String fecha) {
    // Aquí puedes implementar la lógica para guardar la cita en Firebase o en tu base de datos
    crearCitaf(clienteID, empresaID, estado, fecha);
    print("Cita creada:");
    print("Cliente ID: $clienteID");
    print("Empresa ID: $empresaID");
    print("Estado: $estado");
    print("Fecha: $fecha");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Cita'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Información de la empresa
            Text(
              widget.empresa,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(widget.detalle, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 5),
                Text(widget.direccion, style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.blue),
                SizedBox(width: 5),
                Text('Horario: ${widget.horario}', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.phone, color: Colors.blue),
                SizedBox(width: 5),
                Text(widget.telefono, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),

            // Selección de fecha
            Text('Selecciona la fecha:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => _seleccionarFecha(context),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  fechaSeleccionada != null
                      ? "${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}"
                      : "Seleccionar fecha",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Selección de hora
            Text('Selecciona la hora:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () => _seleccionarHora(context),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  horaSeleccionada != null
                      ? "${horaSeleccionada!.hour}:${horaSeleccionada!.minute.toString().padLeft(2, '0')}"
                      : "Seleccionar hora",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 30),

            // Botón de Confirmar Cita
            Center(
              child: ElevatedButton(
                onPressed: _confirmarCita,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text('Confirmar Cita', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
