import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                usuarioController.cargarUsuario(UsuarioModel(
                  nombre: 'Pedro',
                  edad: 43,
                ));
              },
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                usuarioController.cambiarEdad(34);
              },
              child: Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 30),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                usuarioController.agregarProfesion(
                  'Profesión #${usuarioController.profesionesCount + 1}',
                );
              },
              child: Text(
                'Añadir Profesión',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
