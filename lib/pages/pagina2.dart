import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/services/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder:
              (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot) {
            return snapshot.hasData
                ? Text('Data: ${snapshot.data.nombre} (${snapshot.data.edad})')
                : Text('Página 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                final user = new UsuarioModel(nombre: 'Pepe', edad: 55);
                usuarioService.cargarUsuario(user);
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
                usuarioService.cambiarEdad(44);
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
              onPressed: () {},
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
