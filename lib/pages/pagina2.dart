import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuario/bloc.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                final newUser = new UsuarioModel(
                  nombre: 'Pedro',
                  edad: 43,
                  profesiones: ['FullStack Dev', 'Youtuber', 'Gamer'],
                );
                BlocProvider.of<UsuarioBloc>(context)
                    .add(ActivarUsuario(newUser));
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
                BlocProvider.of<UsuarioBloc>(context).add(CambiarEdad(34));
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
                BlocProvider.of<UsuarioBloc>(context)
                    .add(AgregarProfesion('New Profesion '));
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
