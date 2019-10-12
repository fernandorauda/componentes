import 'package:flutter/material.dart';

import 'package:componentes/utils/icono_string_util.dart';
import 'package:componentes/providers/menu_provider.dart';
import 'package:componentes/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _list(),
    );
  }

  Widget _list() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshoot) {
        return ListView(
          children: _listaItems( snapshoot.data, context ),
        );
      },
    );

    //print(menuProvider.opciones);
//    menuProvider.cargarData().then( (opciones) {
//      print('_lista');
//      print(opciones);
//    });

//    return ListView(
//      children: _listaItems(),
//    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    if ( data == null ) { return [];}
    data.forEach((opt) {

      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {
//          final route = MaterialPageRoute(
//              builder: (context) => AlertPage(),
//          );
//          Navigator.push(context, route);
        Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
