import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class BapeProdcut extends StatefulWidget {
  @override
  _BapeProductState createState() => _BapeProductState();
}

class _BapeProductState extends State<BapeProdcut> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    Map parametro = ModalRoute.of(context).settings.arguments;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          _imagenFondo(),
          Positioned(
              //top: 150.0,
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
                                    .limit(50)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                        children: snapshot.data.docs
                                            .map<Widget>(
                                                (doc) => _buildListItem(doc))
                                            .toList());
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

  // ignore: unused_element
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
                'Precio: ${doc.data()['price']}',
                textAlign: TextAlign.center,
              ),
              onOkButtonPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ));
  }

  //builder de cards para inventario
  _buildListItem(DocumentSnapshot doc) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
        child: Stack(children: [
          InkWell(
              onTap: () async {
                _editarInventario(this.context, doc);
              },
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                      image: new NetworkImage('${doc.data()['image']}'),
                      fit: BoxFit.cover),
                ),
                height: 200.0,
              )),
          Positioned(
              bottom: 20.0,
              left: 0.0,
              child: Container(
                height: 20,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                ),
                child: Text("${doc.data()['title']}",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.0,
                        textStyle: TextStyle(color: Colors.white))),
              )),
          Positioned(
              bottom: 0.0,
              right: 0,
              child: Container(
                width: 300,
                decoration: BoxDecoration(color: Colors.black.withOpacity(.6)),
                child: Text("\$${doc.data()['price']} ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        fontSize: 15.0,
                        textStyle: TextStyle(color: Colors.white))),
              )),
        ]));
  }
}

Widget _imagenFondo() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Image.network(
      ("https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/bape.jpg?alt=media&token=a8acec0b-9fc0-4bb2-9557-2ce790dd15b4"),
      fit: BoxFit.cover,
    ),
  );
}
