class Empresa {
  final String id;
  final String nombre;
  final String email;
  final String tipo;

  Empresa({
    required this.id,
    required this.nombre,
    required this.email,
    required this.tipo,
  });

  factory Empresa.fromMap(Map<String, dynamic> data, String id) {
    return Empresa(
      id: id,
      nombre: data['nombre'] ?? '',
      email: data['email'] ?? '',
      tipo: data['tipo'] ?? '',
    );
  }
}