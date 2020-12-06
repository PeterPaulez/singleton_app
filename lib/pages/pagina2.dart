import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/services/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: usuarioService.existeUsuario
            ? Text(
                '${usuarioService.usuario.nombre} (${usuarioService.usuario.edad})')
            : Text('No hay usuario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                final newUser = new UsuarioModel(
                  nombre: 'Pedro',
                  //edad: 43,
                  //profesiones: ['Full Stack Dev', 'Youtuber'],
                );
                usuarioService.usuario = newUser;
                print(usuarioService.usuario.profesiones);
              },
              child: Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            OpcionesUsuario(),
          ],
        ),
      ),
    );
  }
}

class OpcionesUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    if (usuarioService.existeUsuario) {
      return Column(
        children: [
          SizedBox(height: 30),
          MaterialButton(
            minWidth: 200,
            onPressed: () {
              usuarioService.cambiarEdad(55);
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
              usuarioService.agregarProfesion();
            },
            child: Text(
              'Añadir Profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
