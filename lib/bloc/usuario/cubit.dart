import 'package:meta/meta.dart'; // Meta es más pequeña que material
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/models/usuario.dart';
// part of en el destino
part 'state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  // Definición constructor controlando el STATE
  UsuarioCubit() : super(UsuarioInit());

  void seleccionarUsuario(UsuarioModel user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    // No se puede llamar directamente para cambiarlo porque es FINAL
    final currentState = state;
    if (currentState is UsuarioActivo) {
      // Cambiamos a FINAL las opciones de nuestro MODELO y entonces...
      // No se puede cambiar la propiedad directamente.
      // currentState.usuario.edad = edad;
      final newUser = currentState.usuario.copyWith(edad: 33);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${currentState.usuario.profesiones.length + 1}'
      ];
      final newUser =
          currentState.usuario.copyWith(profesiones: newProfesiones);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInit());
  }
}
