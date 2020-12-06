// Part en el origen
part of 'cubit.dart';

// Clase abastracta inmutable
@immutable
abstract class UsuarioState {}

// Estado inicial de la app
class UsuarioInit extends UsuarioState {
  // Solo se accede al cubit desde éste STATE
  final existeUsuario = false;

  // Sobreescribimos cuando se pasa esta instancia en un PRINT
  /*
  @override
  String toString() {
    return 'UsuarioInicial: existeUsuario: false';
  }
  */
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  // UsuarioModel se importa en el origen del PART
  // Al ser un final y no cambiar tiene que haber un constructor
  final UsuarioModel usuario;

  UsuarioActivo(this.usuario);
}
