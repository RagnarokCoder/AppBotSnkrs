import 'package:bot_sneakers/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:universal_html/prefer_universal/html.dart' as localS;

import 'admin_page.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, dynamic> decodedToken;

String nombre;
  @override
  void initState() { 
    super.initState();
    var token = localS.window.localStorage['usuario'];
     decodedToken = JwtDecoder.decode(token);

    print(decodedToken);

  }

  Widget textfield({@required String hintText}){
    return Material(
      elevation: 4,
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

  
        
          child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing:2,
            color: Colors.black54,
            fontWeight: FontWeight.bold
          ),
          fillColor: Colors.white30,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
          )
        ),
      ),
    );
  }


  Widget textfield2({@required String hintText}){
    return Material(
       
         
          child: TextField(
          
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            letterSpacing:2,
            color: Colors.black,
             fontSize: 20.0,
            
          ),
          fillColor: Colors.white30,
          filled: true,
          border: InputBorder.none,
          
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       appBar: AppBar(
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Perfil",style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
          leading: IconButton(
             onPressed: () {

               

               if(decodedToken["userType"] == "Admin")
               {
                       Route route = MaterialPageRoute(builder: (bc) => AdminPage());
                                                Navigator.of(context).push(route);
               }

               else{

                  Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);
               }
                     
             },
           icon: Icon(
               Icons.arrow_back,
                color: Colors.black,
              ),
          ),

         
          
          
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),

      body: Stack(
        
        alignment: Alignment.center,
        children:[
         
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 480,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal:10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                     textfield2(hintText:"Nombre:"),
                    textfield(hintText: decodedToken["name"].toString()),
                      textfield2(hintText:"Correo:"),
                     textfield(hintText:  decodedToken["email"].toString()),
                       textfield2(hintText:"Usuario:"),
                      textfield(hintText:  decodedToken["userType"].toString()),
                        textfield2(hintText:"Fecha de Expiración:"),
                       textfield(hintText: decodedToken["expirationDay"].toString()+"/"+decodedToken["expirationMonth"].toString()+"/"+decodedToken["expirationYear"].toString()),
                  ],
                  ),

                )
              ],
         ),
           CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ) ,
                  painter: HeaderCurvedContainer(),
                ),
     
  
        ]
      ),
      
    );

    
  }
}

 
class HeaderCurvedContainer extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size){
    Paint paint = Paint()..color = Color(0xff555555);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0,-150)
      ..close();
      canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
  
}