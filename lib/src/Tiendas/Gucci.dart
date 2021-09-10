import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bot_sneakers/src/pages/Menu-Tennis.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Gucci extends StatefulWidget {
  @override
  _GucciState createState() => _GucciState();
}
NumberFormat f = new NumberFormat("#,##0.00", "es_US");
class _GucciState extends State<Gucci> {
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
        
        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/gucci%20wallpaperr.jpg?alt=media&token=5fb66f4b-0f30-4b17-8b37-23a9991908f8',
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
                Text("Gucci",
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
                    child: Icon(Icons.shopping_bag, color: Colors.white),
                  ),
                ),
              ],
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
          child: StreamBuilder(
         stream: db.collection("GUCCI").limit(50).snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Text("Cargando Productos...");
              }
              int length = snapshot.data.documents.length;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //columnas
                  mainAxisSpacing: 20.0, //espacio entre cards
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 ,// largo de la card
                ),
                itemCount: length,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (_, int index){
                  final DocumentSnapshot doc = snapshot.data.documents[index];
                  return new Container(
                   decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                
              ),
                    child: Card(

                      child: InkWell(
                      onTap: () async {
                      _editarInventario(this.context, doc);
                       },
                      
                      child: Stack(
                         children: [
         


       
    Container(
      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                
              ),
      child: Image.network(
        
        '${doc.data()['image']}',
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

        height: 350.0,
        width: MediaQuery.of(context).size.width,
      ),


    


      Positioned(
            bottom:0.0,
            left: 0.0,
            child: Container(
              
               height: 40,
               width: 300,
                 decoration: BoxDecoration(
             
            
              color: Colors.white,
               
              
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${doc.data()['title']}",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.0)
                ),
                
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("\$"+"${f.format(doc.data()['price'])} ${doc.data()['currency']}",textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0)
                ),
                    ],
                  )
                ],
              )
           
              
            )

            
            
          ),

           
    
  


         
      
        ]
        
                      ),
                      
                    ),

                    
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


         ],
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
                              'Precio: ${f.format(doc.data()['price'])} ${doc.data()['currency']}',
                              textAlign: TextAlign.center,
                            ),
                            onCancelButtonPressed: () async {
                               print(doc.data());
                var usuario = localS.window.localStorage['usuario'];
                String url = 'https://v2-api-bot.herokuapp.com/api/v1/task';

                Map<String, dynamic> map = {
                  "product": doc.data(),
                  "page" : "gucci",
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
                            },  buttonCancelText: Text("Comprar"),
                            onOkButtonPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                          ));

  }
}