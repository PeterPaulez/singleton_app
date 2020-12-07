class UsuarioModel {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  UsuarioModel({this.nombre, this.edad, this.profesiones});

  UsuarioModel copyWith({
    String nombre,
    int edad,
    List<String> profesiones,
  }) =>
      UsuarioModel(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
