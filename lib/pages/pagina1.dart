import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/services/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Estamos dentro de un build por tanto el listen redibuja todo
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              final usuarioService =
                  Provider.of<UsuarioService>(context, listen: false);
              usuarioService.removerUsuario();
            },
          )
        ],
        title: Text('Provider'),
      ),
      body: (usuarioService.existeUsuario)
          ? InformacionUsuario(usuarioService.usuario)
          : Center(child: Text('No hay usuario seleccionado')),
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
            title: Text('Nombre: ${this.usuario.nombre}'),
            subtitle: Text('Nombre del usuario'),
          ),
          ListTile(
            title: Text('Edad: ${this.usuario.edad}'),
            subtitle: Text('Edad del usuario'),
          ),
          SizedBox(height: 30),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones
              .map(
                (profesion) => ListTile(
                  title: Text(profesion),
                ),
              )
              .toList()
          /*
          ListTile(
            title: Text('Dentista: '),
            subtitle: Text('Doctos de los dientes'),
          ),
          */
        ],
      ),
    );
  }
}
