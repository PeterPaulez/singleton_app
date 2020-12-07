import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuario/bloc.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider.of<UsuarioBloc>(context).add(BorrarUsuario());
            },
          )
        ],
        title: Text('Pagina 1'),
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          // Cuando haya un cambio en el state, redibujamos este widget
          if (state.existeUsuario) {
            return InformacionUsuario(state.usuario);
          } else {
            return Center(child: Text('No hay usuario seleccionado'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final UsuarioModel usuario;
  const InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
            subtitle: Text('Nombre del usuario'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
            subtitle: Text('Edad del usuario'),
          ),
          SizedBox(height: 30),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),

          // Barrermos las profesiones del usuario
          // los ... es un express
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
