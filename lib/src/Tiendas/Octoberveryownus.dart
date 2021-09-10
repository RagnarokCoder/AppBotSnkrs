
import 'dart:convert';
import 'dart:ui';
import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:bot_sneakers/src/pages/Menu-Tennis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/prefer_universal/html.dart' as localS;
class Octoberveryownus extends StatefulWidget {
  @override
  _OctoberveryownusState createState() => _OctoberveryownusState();
}

//variables
dynamic image;
var selectedUsState;
dynamic precio, preciomin;
TextEditingController _cantidadProducto = TextEditingController();
TextEditingController _precioMinimo = TextEditingController();
NumberFormat f = new NumberFormat("#,##0.00", "es_US");
List<String> talla = <String>[
  'Small',
  'Medium',
  'Large',
  'X-Large',
];


class _OctoberveryownusState extends State<Octoberveryownus> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
     
      body: Stack(
        children: <Widget>[
        
           Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
        
        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/october.jpg?alt=media&token=992b9a6b-fcfb-4191-9c53-58f7af7eda52',
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
            filter: new ImageFilter.blur(sigmaX: 4, sigmaY: 4),
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
                    child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: ()
                    {
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MenuTennis1()));

                    }),
                    
                  )
                  
                ),
                Text("October´s Very Own",
                style: GoogleFonts.montserrat(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(color: Colors.white)
                )
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  
                  child: Center(
                    child: Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                ),
              ],
            )
          ),
                
               Positioned(
            top: 50.0,
            
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                
                children: <Widget>[
                 
                   Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width-40,
                    child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                         
                     _crearBotonRedondeado(Icons.person, 'Talla'),
                     SizedBox(width: 5,),
                      _filtrarporprecio(Icons.monetization_on, 'Precio Ma.'),
                       SizedBox(width: 5,),
                      _preciomin(Icons.monetization_on, 'Precio Mi'),
                       SizedBox(width: 5,),
                      
                   
                  ],
                      
                    )
                    
                  ),
                ],
              )
              
            )
          ),
                

                Positioned(
            top: 120.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: 800,
              child: Padding(
              padding: EdgeInsets.all(30.0),
              child: ListView(
                children: [
                 StreamBuilder<QuerySnapshot>(
                          
            stream: db.collection('OCTOBERS_VERY_OWN_US').where("price", isLessThanOrEqualTo: precio).where("price", isGreaterThanOrEqualTo: preciomin)
            .where("title_variant", isEqualTo: selectedUsState).snapshots(),
            builder: (context, snapshot) {
             
                if (snapshot.hasData) {
                return Column(children: snapshot.data.docs.map<Widget>((doc) => _buildlist(doc)).toList());
                
              } else { 
                return SizedBox();
              }
              
             
            },
            
          ),
                ],
              )
 
            ),
            )
          ),
          

           
            
            ]

        ),
    );
  }

  _buildlist(DocumentSnapshot doc)
  {
   return Padding(
     padding: EdgeInsets.all(8),
     child: Container(
                    
                   
                    child:  Align(
                      
   alignment: Alignment.centerRight, 

   
             child:Container(
            decoration: new BoxDecoration(
               color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: new DecorationImage(
                          image: new NetworkImage( '${doc.data()['image']}'),
                          
                          fit: BoxFit.cover),
                    ),
                    height: 200.0,

                   child: FlipCard(

                     

                      flipOnTouch: true,
                      direction: FlipDirection.HORIZONTAL,

                      front: Container(

                    
                      ),
                      back: Container(

                         
                                    
                                       
                              decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue[900].withOpacity(.6),
                            
                            
                          ),

                          alignment:Alignment.center ,
                            child: new Column(
                            children:[
                            
                          Container(
                             padding: new EdgeInsets.only(top: 26.0),
                            child:Text("${doc.data()['title']}\n\n \$${f.format(doc.data()['price'])} ${doc.data()['currency']}",textAlign: TextAlign.center,
                               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),
                               

                              
                              )),
                              new Container(
                      padding: new EdgeInsets.only(top: 26.0),
                           child: FlatButton(
                             
                            padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 100,),
                            onPressed: () async {
                           var usuario = localS.window.localStorage['usuario'];
                                 String url = 'https://v2-api-bot.herokuapp.com/api/v1/task';

                Map<String, dynamic> map = {
                  "product": doc.data(),
                  "page" : "octobers_very_own_us",
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
                            
                            },
                            child: Text(
                              "Comprar",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.black,
                            shape: StadiumBorder(),
                          )
                              )

                              
                              ]),

                              
                    
                      ),

                       
                    )
                    
                  )
                  
                  
                  )),
   );
     
  }


   Widget _crearBotonRedondeado(IconData icono, String texto) {
    return GestureDetector(
      onTap: (){
        showMaterialScrollPicker(
    context: context,
    title: "Filtrar Por Talla",
    items: talla,
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
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)),
             
          ],),
        ),
      ),
    );
  }

  Widget _preciomin(IconData icono, String texto) {
    return GestureDetector(
      onTap: (){
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
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)),
             
          ],),
        ),
      ),
    );
  }

    Widget _filtrarporprecio(IconData icono, String texto) {
    return GestureDetector(
      onTap: (){
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
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)),
             
          ],),
        ),
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
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Precio: ${doc.data()['price']}',
                              textAlign: TextAlign.center,
                            ),

                            onOkButtonPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                          ));

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
            content:  Container(
                              height: 170.0,
                              width: 170.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Filtrar Por Precio\nMáximo",  style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),),
                                  SizedBox(height: 10,),
                                  TextField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
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
                                      textStyle:
                                          TextStyle(color: Colors.black))),
                                        SizedBox(height: 10,),
                                        RaisedButton.icon(
                                          label: Text("Filtrar",  style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white),),
                                          color: Colors.black,
                                          elevation: 0,
                                          icon: Icon(Icons.search, color: Colors.white, size: 20.0,),
                                          onPressed: (){
                                            precio=double.parse(_cantidadProducto.text.toString());
                                            Navigator.of(context, rootNavigator: true).pop();
                                          },
                                        )
                                ],
                              )
                            )
                
            
          );
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
            content:  Container(
                              height: 170.0,
                              width: 170.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Filtrar Por Precio\nMinimo",  style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),),
                                  SizedBox(height: 10,),
                                  TextField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
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
                                      textStyle:
                                          TextStyle(color: Colors.black))),
                                        SizedBox(height: 10,),
                                        RaisedButton.icon(
                                          label: Text("Filtrar",  style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white),),
                                          color: Colors.black,
                                          elevation: 0,
                                          icon: Icon(Icons.search, color: Colors.white, size: 20.0,),
                                          onPressed: (){
                                            preciomin=double.parse(_precioMinimo.text.toString());
                                            Navigator.of(context, rootNavigator: true).pop();
                                          },
                                        )
                                ],
                              )
                            )
                
            
          );
        });

        
}
  
}