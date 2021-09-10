import 'dart:ui';

import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:bot_sneakers/src/Pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';



import '../layout/mainLayout.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Column(children: [
        _botonesRedondeados(),
        
      ],)
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.dashboard, 'DASHBOARD', 'dashboard'),
            _crearBotonRedondeado3(Icons.list_alt, 'TASKS', 'tasks')
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.group, 'CUENTAS'),
            _crearBotonRedondeado2(Icons.store, 'Almacen','menutennis')
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.credit_card, 'TARJETAS'),
            _crearBotonRedondeado4(Icons.people,'CONFIGURACIÓN')
          ]
        )
      ],
    );
  }

  Widget _crearBotonRedondeado(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
          Navigator.pushNamed(context, route);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

  Widget _crearBotonRedondeado2(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
              
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }


   Widget _crearBotonRedondeado3(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
              Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Calendar()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

  Widget _crearBotonRedondeado4(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
              Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Profile()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }


  
}