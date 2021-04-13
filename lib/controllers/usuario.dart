import 'package:get/get.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuarioController extends GetxController {
  RxBool existeUsuario = false.obs;
  Rx<UsuarioModel> usuario = new UsuarioModel().obs;
  /*
  // Seria lo mismo que arriba
  var existeUsuario = false.obs;
  var usuario = new UsuarioModel().obs;
  */

  void cargarUsuario(UsuarioModel newUser) {
    this.existeUsuario.value = true;
    this.usuario.value = newUser;
  }
}
