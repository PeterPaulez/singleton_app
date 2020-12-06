class UsuarioModel {
  String nombre;
  int edad;
  List<String> profesiones;

  // Default value of constructor
  UsuarioModel(
      {this.nombre,
      this.edad = 43,
      this.profesiones = const ['Sin profesiones']});
}
