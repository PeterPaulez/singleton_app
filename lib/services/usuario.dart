import 'dart:async';

import 'package:singleton_app/models/usuario.dart';

class _UsuarioService {
  UsuarioModel _usuario;
  // BroadCast es para que se pueda escuchar desde más de un WIDGET
  StreamController<UsuarioModel> _usuarioStreamController =
      new StreamController<UsuarioModel>.broadcast();

  UsuarioModel get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;
  // Exponemos el GET del stream para que pueda ser escuchado (hay que envolver con StreamBuilder)
  Stream<UsuarioModel> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(UsuarioModel user) {
    this._usuario = user;
    this._usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    this._usuarioStreamController.add(this._usuario);
  }

  dispose() {
    this._usuarioStreamController?.close();
  }
}

final usuarioService = new _UsuarioService();
