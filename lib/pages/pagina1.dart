import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text('Pagina 1'),
      ),
      body: Obx(
        () => usuarioController.existeUsuario.value
            ? InformacionUsuario(usuario: usuarioController.usuario.value)
            : NoUsuario(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        //onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre': 'Pedro',
          'edad': 43,
        }),
      ),
    );
  }
}

class NoUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('No hay usuario seleccionado')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final UsuarioModel usuario;
  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

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
