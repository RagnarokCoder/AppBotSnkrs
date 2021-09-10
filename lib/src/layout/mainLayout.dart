import 'dart:ui';

import 'package:bot_sneakers/src/Globals/header.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {

  final dynamic content;

  const MainLayout ({
    Key key,
    this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
        _imagenFondo(),
        ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.1,
              child: Header(),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.9,
              child: ListView(
                children: [
                  content
                ],
              )
            )

          ],
          )
      ],),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/snkrsback.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }
}