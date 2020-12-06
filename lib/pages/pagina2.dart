import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuario/cubit.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);
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
                  nombre: 'David',
                  edad: 24,
                  profesiones: ['FullStack Developer', 'Machine learning'],
                );
                usuarioCubit.seleccionarUsuario(newUser);
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
                usuarioCubit.cambiarEdad(30);
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
                usuarioCubit.agregarProfesion();
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
