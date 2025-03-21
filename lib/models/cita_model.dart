class Cita {
  final String id;
  final String empresaId;
  final String clienteId;
  final String fecha;
  final String estado;

  Cita({
    required this.id,
    required this.empresaId,
    required this.clienteId,
    required this.fecha,
    required this.estado,
  });

  factory Cita.fromMap(Map<String, dynamic> data, String id) {
    return Cita(
      id: id,
      empresaId: data['empresaId'] ?? '',
      clienteId: data['clienteId'] ?? '',
      fecha: data['fecha'] ?? '',
      estado: data['estado'] ?? 'pendiente',
    );
  }
}