import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/services/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(snapshot.data)
              : Center(child: Text('No hay usuario seleccionado'));
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
          ListTile(
            title: Text('Dentista: '),
            subtitle: Text('Doctos de los dientes'),
          ),
          ListTile(
            title: Text('Carnicero: '),
            subtitle: Text('Cortador de carnes'),
          ),
          ListTile(
            title: Text('Futbolista: '),
            subtitle: Text('Deportista de Fútbol'),
          ),
        ],
      ),
    );
  }
}
