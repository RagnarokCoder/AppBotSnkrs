import 'dart:ui';

import 'package:flutter/material.dart';
import './glassContainer.dart';


class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassContainer(
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  
                  Text('God King Bot', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  
                ],
              )
            )
        ],)
      )
    );
  }
}