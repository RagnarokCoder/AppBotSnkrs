import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parallax/flutter_parallax.dart';

import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class Kawzone extends StatefulWidget {
  Kawzone({Key key}) : super(key: key);

  @override
  _KawzoneState createState() => _KawzoneState();
}

NumberFormat f = new NumberFormat("#,##0.00", "es_US");

class _KawzoneState extends State<Kawzone> {
  String buscador;
  int filtro = 1;
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    Map parametro = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/kaw.jpg?alt=media&token=0a263936-5b6a-4684-8138-f643fe663655',
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: 40.0,
                      width: 35.0,
                      child: Center(
                        child: IconButton(
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: () {
                              
                            }),
                      )),
                  Text("Kawsone",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(color: Colors.white))),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Icon(Icons.bookmark_border, color: Colors.white),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 150.0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 800.0,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            padding: EdgeInsets.all(18),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              StreamBuilder<QuerySnapshot>(
                                stream: db
                                    .collection(parametro['producto'])
                                    .where("title",
                                        isGreaterThanOrEqualTo: buscador)
                                    .limit(50)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if (parametro['producto'] == "FENDI" ||
                                        parametro['producto'] == "GUCCI") {
                                      return Column(
                                          children: snapshot.data.docs
                                              .map<Widget>(
                                                  (doc) => _buildListItem2(doc))
                                              .toList());
                                    } else {
                                      return Column(
                                          children: snapshot.data.docs
                                              .map<Widget>(
                                                  (doc) => _buildListItem(doc))
                                              .toList());
                                    }
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ],
                          ))
                    ],
                  ))),
        ]),
      ),
    );
  }

  //builder de cards para inventario
  _buildListItem(DocumentSnapshot doc) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Stack(children: [
          new Parallax.inside(
            child: InkWell(
                onTap: () async {
                  _editarInventario(this.context, doc);
                },
                child: new Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new NetworkImage('${doc.data()['image']}'),
                        fit: BoxFit.cover),
                  ),
                  height: 350.0,
                )),
            mainAxisExtent: 190.0,
          ),
          Positioned(
              bottom: 14.0,
              left: 0.0,
              child: Container(
                height: 20,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text("${doc.data()['title']}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0)),
              )),
          Positioned(
              bottom: 0.0,
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                    "\$" +
                        "${f.format(doc.data()['display_price'])} ${doc.data()['currency']}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0)),
              )),
        ]));
  }

  _editarInventario(BuildContext context, DocumentSnapshot doc) async {
    // ignore: deprecated_member_use
    return showDialog(
        context: context,
        builder: (_) => NetworkGiffyDialog(
              image: Image.network(
                '${doc.data()['image']}',
                fit: BoxFit.fitHeight,
              ),
              entryAnimation: EntryAnimation.BOTTOM,
              title: Text(
                '${doc.data()['title']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Precio: ${doc.data()['display_price']}',
                textAlign: TextAlign.center,
              ),
              onOkButtonPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ));
  }
}

_buildListItem2(DocumentSnapshot doc) {
  return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(children: [
        Container(
          height: 160.0,
          width: 355.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 9,
                color: Colors.black,
                spreadRadius: -.5,
                offset: Offset(
                  1, // Move to right 10  horizontally
                  3.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 5.0,
          right: 15.0,
          child: Container(
              height: 50.0,
              width: 55.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              child: Center(
                  child: IconButton(
                alignment: Alignment.center,
                icon: new Icon(
                  Icons.info,
                  color: Colors.black,
                  size: 30.0,
                ),
                onPressed: () {},
              ))),
        ),
        Positioned(
          left: 25,
          top: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black,
                  spreadRadius: -5,
                  offset: Offset(
                    0, // Move to right 10  horizontally
                    -.5, // Move to bottom 10 Vertically
                  ),
                )
              ],
            ),
            child: Image.network(
              ('${doc.data()['image']}'),
              height: 120,
              width: 130,
            ),
          ),
        ),
        Positioned(
            top: 40.0,
            right: 40.0,
            child: Container(
              height: 80,
              width: 120,
              child: Text("${doc.data()['name']}",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                      textStyle: TextStyle(color: Colors.black))),
            )),
        Positioned(
            top: 110.0,
            right: 75.0,
            child: Container(
              child: Text("${doc.data()['price']} ",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      fontSize: 17.0,
                      textStyle: TextStyle(color: Colors.black))),
            )),
      ]));
}
