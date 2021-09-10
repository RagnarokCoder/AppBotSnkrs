
import 'dart:convert';
import 'dart:ui';
import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bot_sneakers/src/pages/Menu-Tennis.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Funko extends StatefulWidget {
  @override
  _FunkoState createState() => _FunkoState();
}
dynamic precio, preciomin;
NumberFormat f = new NumberFormat("#,##0.00", "es_US");
TextEditingController _cantidadProducto = TextEditingController();
TextEditingController _precioMinimo = TextEditingController();
class _FunkoState extends State<Funko> {
  @override
   Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return Scaffold(
     
      body: Stack(
        children: [
Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
        
        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/funko.jpg?alt=media&token=814904b4-f40b-4999-95e1-df4f05c36dd5',
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
                Text("Funko",
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(color: Colors.white)
                )
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  
                  child: Center(
                    child: Icon(Icons.bookmark_border, color: Colors.white),
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
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child:
                  Column(
                    children: [
                      Container(
                    height: 700,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      padding: EdgeInsets.all(18),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        
                         Container(
                          height: 700,
                          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
         stream: db.collection("FUNKO").where("price", isLessThanOrEqualTo: precio).where("price", isGreaterThanOrEqualTo: preciomin).limit(100).snapshots(),
            builder: (context, snapshot) {
                  
              if(!snapshot.hasData){
                return Text("Cargando Productos...");
              }
              int length = snapshot.data.docs.length;
          
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //columnas
                  mainAxisSpacing: 30.0, //espacio entre cards
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0 ,// largo de la card
                ),
                itemCount: length,
                padding: EdgeInsets.all(1.0),
                itemBuilder: (_, int index){
                  final DocumentSnapshot doc = snapshot.data.docs[index];
                  return new Container(
                   child:Container(
            decoration: new BoxDecoration(
               color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 9, color: Colors.black, spreadRadius:-.5, offset: Offset(
              1, // Move to right 10  horizontally
              3.0, // Move to bottom 10 Vertically
            ),)],
                      borderRadius: BorderRadius.all(Radius.circular(100)),
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
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: Colors.black.withOpacity(.6),
                            
                            
                          ),

                            child: new Column(
                            children:[
                            
                          Container(
                             padding: new EdgeInsets.only(top: 30.0),

                          alignment:Alignment.center ,
                            child: Text("${doc.data()['title']}\n \$${f.format(doc.data()['price'])} ${doc.data()['currency']}",textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.0)

                              
                              ),
                            
                      
                    
                      ),new Container(
                      padding: new EdgeInsets.only(top: 1 
                      ),
                           child: FlatButton(
                             
                            padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15,),
                            onPressed: () async {
                           var usuario = localS.window.localStorage['usuario'];
                                 String url = 'https://v2-api-bot.herokuapp.com/api/v1/task';

                Map<String, dynamic> map = {
                  "product": doc.data(),
                  "page" : "funko",
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
                             ])
                             
                             
                             ),

                              
                              )
                    
                  ));
                  

                },
                
              );
            }
        )  )
                        
         
            

          
                      ],
                      
                    )
                    
                  ),
                    ],
                  )
                  
                 
   
                  
                 
                  
                  
                  
                  
               
            )
          ),



       ])
    );
  }


  //filtros
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




