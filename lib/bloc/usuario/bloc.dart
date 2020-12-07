import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton_app/models/usuario.dart';

part 'state.dart';
part 'event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  // Se hizo esta construcción dando a CMD + .
  @override
  // async* es una funcion generadora no es un future, sino un stream
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print(event);

    // Emite y redibuja los widgets donde se escuche este bloc
    if (event is ActivarUsuario) {
      yield state.copyWith(
        user: event.usuario,
      );
    } else if (event is CambiarEdad) {
      yield state.copyWith(
        user: state.usuario.copyWith(edad: event.edad),
      );
    } else if (event is AgregarProfesion) {
      final newProfesiones = [
        ...state.usuario.profesiones, // Desestructurar el arreglo
        event.profesion + '${state.usuario.profesiones.length + 1}'
      ];
      yield UsuarioState(
        user: state.usuario.copyWith(profesiones: newProfesiones),
      );
    } else if (event is BorrarUsuario) {
      // Lo mandamos sin datos, entonces el constructor lo crea empty
      // Pero pillaría valores por defecto, no es del todo BELLO
      yield state.initUser();
    }
  }
}
