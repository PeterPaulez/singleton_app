import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/pages/pagina1.dart';
import 'package:singleton_app/pages/pagina2.dart';
import 'package:singleton_app/services/usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Pagina1Page(),
          'pagina2': (_) => Pagina2Page(),
        },
      ),
    );
  }
}
