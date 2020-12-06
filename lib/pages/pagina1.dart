import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuario/cubit.dart';
import 'package:singleton_app/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => usuarioCubit.borrarUsuario(),
          )
        ],
        title: Text('Pagina 1'),
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInit:
            return Center(child: Text('No hay información de usuario'));
            break;
          case UsuarioActivo:
            // Casteamos el state diciendo que es UsuarioActivo y así funka
            return InformacionUsuario((state as UsuarioActivo).usuario);
            break;
          default:
            return Center(child: Text('Estado no reconocido'));
        }
        /*
        print(state);
        if (state is UsuarioInit) {
          return Center(child: Text('No hay información de usuario'));
        } else if (state is UsuarioActivo) {
          return InformacionUsuario(state.usuario);
        } else {
          // Ponemos el elseIF para ver la info de state, sino no nos deja
          return Center(child: Text('Estado no reconocido'));
        }
        */
      },
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
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
        ],
      ),
    );
  }
}
