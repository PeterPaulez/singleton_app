class UsuarioModel {
  String nombre;
  int edad;
  List<String> profesiones;

  UsuarioModel({
    required this.nombre,
    required this.edad,
    this.profesiones = const [],
  });
}
