import 'dart:convert';
import 'dart:ui';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:bot_sneakers/src/pages/Menu-Tennis.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Nike extends StatefulWidget {
  @override
  _NikeState createState() => _NikeState();
}
bool icono = false;
var selectedUsState;
dynamic precio, preciomin;
TextEditingController _cantidadProducto = TextEditingController();
TextEditingController _precioMinimo = TextEditingController();
var usuario = localS.window.localStorage['usuario'];
NumberFormat f = new NumberFormat("#,##0.00", "es_US");
List<String> usStates = <String>[
  '4',
  '4.5',
  '5',
  '5.5',
  '6',
  '6.5',
  '7',
  '7.5',
  '8',
  '8.5',
];

class _NikeState extends State<Nike> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
      height: MediaQuery.of(context).size.height*0.1,
      decoration: BoxDecoration(
        color: Colors.transparent,
        
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
        decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                shape: BoxShape.rectangle
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        FlatButton(
                    padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(50,75))),
              color: Colors.white,
              onPressed: () {
                
                icono = false;
                setState(() {
                  
                });
                
              },
              child: Text("México",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
              ),
            ),
            icono == false?
            Icon(Icons.circle, size: 15, color: Colors.black) : SizedBox(),
                      ],
                    )
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        FlatButton(
                    padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(50,75))),
              color: Colors.white,
              onPressed: () {
                
                icono = true;
                setState(() {
                  
                });
              },
              child: Text("USA",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
              ),
            ),
            icono == true?
            Icon(Icons.circle, size: 15, color: Colors.black) : SizedBox(),
                      ],
                    )
                  ),
                ],
              ),
      )
    ),
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/nike2.jpg?alt=media&token=029deebe-e6c3-44ed-8d3e-9cd3365aaa43',
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
            filter: new ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MenuTennis1()));
                            }),
                      )),
                  icono == false?Text("Nike Mx",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(color: Colors.white))):
                          Text("Nike Usa",
                      style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          textStyle: TextStyle(color: Colors.white))),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Icon(Icons.shopping_bag_rounded, color: Colors.white),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: 50.0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width - 40,
                          child: ListView(
                            padding: EdgeInsets.all(8),
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              _crearBotonRedondeado(Icons.search, 'Talla'),
                              SizedBox(
                                width: 5,
                              ),
                              _filtrarporprecio(
                                  Icons.monetization_on, 'Precio Ma.'),
                              SizedBox(
                                width: 5,
                              ),
                              _preciomin(Icons.monetization_on, 'Precio Mi'),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          )),
                    ],
                  ))),
          Positioned(
              top: 140.0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height*0.7,
                          width: MediaQuery.of(context).size.width,
                          child: ListView(
                            padding: EdgeInsets.all(18),
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              icono == false? StreamBuilder<QuerySnapshot>(
                                stream: db
                                    .collection('NIKE_MX')
                                    .where("price", isLessThanOrEqualTo: precio)
                                    .where("price",
                                        isGreaterThanOrEqualTo: preciomin)
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
                              ):
                              StreamBuilder<QuerySnapshot>(
                                stream: db
                                    .collection('NIKE_USA')
                                    .where("price", isLessThanOrEqualTo: precio)
                                    .where("price",
                                        isGreaterThanOrEqualTo: preciomin)
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

  _editarInventario(BuildContext context, DocumentSnapshot doc) async {
    // ignore: deprecated_member_use
    return showDialog(
        context: context,
        builder: (_) => NetworkGiffyDialog(
              image: Image.network(
                '${doc.data()['image']}',
              ),
              entryAnimation: EntryAnimation.BOTTOM,
              title: Text(
                '${doc.data()['title']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Precio: ${f.format(doc.data()['price'])} ${doc.data()['currency']}',
                textAlign: TextAlign.center,
              ),
              onCancelButtonPressed: () async { 
                //////////////////////////////////////////////////////////////////
                ///

                print(doc.data());

                String url = 'https://v2-api-bot.herokuapp.com/api/v1/task';

                Map<String, dynamic> map = {
                  "product": doc.data(),
                  "page" : "nike_usa",
                  "idProfileGroup": "KZwSKKaUDWys3vecXUMd",
                  "idProxyGroup": "FueDWQBBVZzmc9wbUrcD"
                };

                final response = await http.post(url,
                    headers: {
                      'content-type': 'application/json',
                      'Accept': 'application/json',
                      'Authorization':
                          'Bearer $usuario',
                    },
                    body: jsonEncode(map));
                if (response.statusCode <= 205) {
                  print(response.body.toString());
                } else {
                  print(response.body.toString());
                  //   throw Exception("Failed to load data");
                }
                Navigator.of(context, rootNavigator: true).pop();
              },
              buttonCancelText: Text("Comprar"),
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
          Container(
            margin: const EdgeInsets.only(),
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            height: 180.0,
          ),
          Positioned(
              right: 15,
              bottom: 0.1,
              child: Container(
                child: InkWell(
                  onTap: () async {
                    _editarInventario(this.context, doc);
                  },
                  child: ClipRRect(
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(400.0),
                        topRight: const Radius.circular(40.0),
                        bottomLeft: const Radius.circular(100.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                      child: Image.network(
                        ('${doc.data()['image']}'),
                        height: 260,
                        width: 290,
                      )),
                ),
              )),
          Positioned(
              bottom: 30.0,
              left: 20.0,
              child: Container(
                height: 20,
                width: 300,
                child: Text("${doc.data()['title']}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0)),
              )),
          Positioned(
              bottom: 10.0,
              right: 60,
              child: Container(
                width: 300,
                child: Text(
                    "\$${f.format(doc.data()['price'])} ${doc.data()['currency']} ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0)),
              )),
        ]));
  }

  //filtros
  Widget _crearBotonRedondeado(IconData icono, String texto) {
    return GestureDetector(
      onTap: () {
        showMaterialScrollPicker(
          context: context,
          title: "Filtrar Por Talla",
          items: usStates,
          selectedItem: selectedUsState,
          onChanged: (value) => setState(() => selectedUsState = value),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 50,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5.0),
              Icon(icono, color: Colors.white, size: 28.0),
              Text(texto,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _preciomin(IconData icono, String texto) {
    return GestureDetector(
      onTap: () {
        openAlertBoxPrecioMin();
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 50,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5.0),
              Icon(icono, color: Colors.white, size: 28.0),
              Text(texto,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _filtrarporprecio(IconData icono, String texto) {
    return GestureDetector(
      onTap: () {
        openAlertBox();
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 50,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5.0),
              Icon(icono, color: Colors.white, size: 28.0),
              Text(texto,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                  height: 170.0,
                  width: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Filtrar Por Precio\nMáximo",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                new RegExp('[\\-|\\ ]'))
                          ],
                          decoration: new InputDecoration(
                              hintText: "Precio",
                              suffixText: "0",
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white.withOpacity(0.8),
                              filled: true),
                          controller: _cantidadProducto,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              textStyle: TextStyle(color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton.icon(
                        label: Text(
                          "Filtrar",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        color: Colors.black,
                        elevation: 0,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () {
                          precio =
                              double.parse(_cantidadProducto.text.toString());
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      )
                    ],
                  )));
        });
  }

  openAlertBoxPrecioMin() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.only(top: 10.0),
              content: Container(
                  height: 170.0,
                  width: 170.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Filtrar Por Precio\nMinimo",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(
                                new RegExp('[\\-|\\ ]'))
                          ],
                          decoration: new InputDecoration(
                              hintText: "Precio",
                              suffixText: "0",
                              hintStyle: TextStyle(color: Colors.black),
                              fillColor: Colors.white.withOpacity(0.8),
                              filled: true),
                          controller: _precioMinimo,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              textStyle: TextStyle(color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton.icon(
                        label: Text(
                          "Filtrar",
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        color: Colors.black,
                        elevation: 0,
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20.0,
                        ),
                        onPressed: () {
                          preciomin =
                              double.parse(_precioMinimo.text.toString());
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      )
                    ],
                  )));
        });
  }
}
