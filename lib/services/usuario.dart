import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  UsuarioModel _usuario;

  UsuarioModel get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  set usuario(UsuarioModel user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    try {
      this
          ._usuario
          .profesiones
          .add('Profesion ${this._usuario.profesiones.length + 1}');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
