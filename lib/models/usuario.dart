import 'package:meta/meta.dart';

class UsuarioModel {
  String nombre;
  int edad;
  List<String> profesiones;

  //UsuarioModel({@required this.nombre, this.edad, this.profesiones});
  UsuarioModel({@required this.nombre, this.edad, this.profesiones})
      : assert(nombre != null);
}
