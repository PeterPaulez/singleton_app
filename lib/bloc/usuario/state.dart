part of 'bloc.dart';

class UsuarioState {
  // Son propiedades finales por:
  // 1. inicializar al momento de definirlas
  // 2. o las definimos en el constructor
  final bool existeUsuario; // Propiedades inicializadas en NULL + FALSE
  final UsuarioModel usuario;

  // Ponemos {} para que sean opcionales
  UsuarioState({UsuarioModel user})
      : usuario = user ?? null,
        existeUsuario = (user != null) ? true : false;

  // Mantiene usuario en su anterior valor a menos que le mande otro
  UsuarioState copyWith({UsuarioModel user}) => UsuarioState(
        user: user ?? this.usuario,
      );
  UsuarioState initUser() => new UsuarioState();
}
