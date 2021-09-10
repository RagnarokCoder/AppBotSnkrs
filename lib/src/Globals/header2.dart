
import 'package:flutter/material.dart';
import './glassContainer.dart';


class Header2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlassContainer(
              height: 100.0,
              width: 380.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Text('Bot Snkrs', style: TextStyle(color: Colors.white, fontSize: 18)),
                 

                  
                ],
              )
            )
        ],)
      )
    );
  }
}