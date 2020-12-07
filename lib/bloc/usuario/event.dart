part of 'bloc.dart';

@immutable
abstract class UsuarioEvent {
  // Al ser una clase abstracta será la que controle los eventos
  // Es inmutable y necesitamos el paquete MATERIAl, pero con META es suficiente.
}

class ActivarUsuario extends UsuarioEvent {
  final UsuarioModel usuario;
  ActivarUsuario(this.usuario);

  // Demo de lo que saca el PRINT para esta clase
  @override
  String toString() {
    return 'Instance of Usuario: ${this.usuario.nombre} // ${this.usuario.edad} // ${this.usuario.profesiones} ';
  }
}

class CambiarEdad extends UsuarioEvent {
  final int edad;
  CambiarEdad(this.edad);
}

class AgregarProfesion extends UsuarioEvent {
  final String profesion;
  AgregarProfesion(this.profesion);
}

class BorrarUsuario extends UsuarioEvent {}
