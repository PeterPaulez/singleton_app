import 'package:get/get.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<UsuarioModel> usuario = new UsuarioModel().obs;
  int get profesionesCount {
    return this.usuario.value.profesiones.length;
  }
  /*
  // Seria lo mismo que arriba
  var existeUsuario = false.obs;
  var usuario = new UsuarioModel().obs;
  */

  void cargarUsuario(UsuarioModel newUser) {
    this.existeUsuario.value = true;
    this.usuario.value = newUser;
  }

  void cambiarEdad(int edad) {
    this.usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String profesion) {
    this.usuario.update((val) {
      // Desustructuración con las profesiones anteriores + nueva profesión
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
