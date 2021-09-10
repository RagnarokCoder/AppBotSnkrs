import 'dart:ui';

import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bot_sneakers/src/layout/mainLayout.dart';
import 'package:bot_sneakers/src/model/product.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final List<Product> productList = [
    Product('Jordan 1 Mid Signal Blue (GS)', 100, 'Nike', 'USA', 'BQ6931-402', 
    'Signal Blue/White-Black', 'assets/Jordan1Mid.png', DateTime(2012-01-01), 
    'Manolo_1', 'Tarjeta', 'BTW', 'Bots', 'Inicio del lanzamiento'),
    Product('Tenis', 700, 'Adidas', 'USA', 'AS8851-105', 
    'White-Black', 'assets/Jordan1Mid.png', DateTime(2012-03-05), 
    'Manolo_1', 'Tarjeta', 'BTW', 'Bots', 'Inicio del lanzamiento')
  ];

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: GlassContainer(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.90,
            child:
              _crearTabla()            
          )
    );
          

  }




  Widget _crearTabla() {
    return DataTable(
      columns: [
        DataColumn(label: Text('ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0))),
        DataColumn(label: Text('PRODUCTO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0))),
        DataColumn(label: Text('VER', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)))
      ],
      rows: 
        productList.map((e) =>  DataRow(cells: [
          DataCell(Text((productList.indexOf(e)+1).toString(), style: TextStyle(color: Colors.white))),
          DataCell(Text(e.nombre, style: TextStyle(color: Colors.white))),
          DataCell(Icon(Icons.visibility, color: Colors.white))
        ])).toList()
    );
  }
}