import 'dart:convert';
import 'dart:ui';
import 'package:bot_sneakers/src/Pages/calendar.dart';
import 'package:bot_sneakers/src/pages/login.dart';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:bot_sneakers/src/Adds/adduser.dart';
import 'package:bot_sneakers/src/Globals/glassContainer.dart';
import 'package:bot_sneakers/src/List/List_Cards.dart';
import 'package:bot_sneakers/src/List/List_tasks.dart';
import 'package:bot_sneakers/src/List/List_users.dart';
import 'package:bot_sneakers/src/List/profile_list.dart';
import 'package:bot_sneakers/src/pages/Menu-Tennis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yudiz_modal_sheet/yudiz_modal_sheet.dart';
import '../layout/mainLayout.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {


  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Column(children: [
        _botonesRedondeados(),

      ],)
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado5(Icons.store, 'Storage','menutennis'),
            _crearBotonRedondeado3(Icons.list_alt, 'Tasks', 'Tasks')
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado6(Icons.group, 'Accounts'),
            _crearBotonRedondeado2(Icons.add, 'Add','adduser')
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Icons.credit_card, 'Cards', 'ListCards'),
            _crearBotonRedondeado8(Icons.calendar_today, 'Calendar')
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado7(Icons.person, 'Profiles'),
            _crearBotonRedondeado4(Icons.logout, 'Log Out')
          ]
        )
      ],
    );
  }

  Widget _crearBotonRedondeado(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
          
           Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ListCards()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

   Widget _crearBotonRedondeado7(IconData icono, String texto) {
    return GestureDetector(
      onTap: (){
       
          
           Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AllProfiles()),
                                      );
        
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

   Widget _crearBotonRedondeado8(IconData icono, String texto) {
    return GestureDetector(
      onTap: (){
       
          
           Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Calendar()),
                                      );
        
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

Widget _crearBotonRedondeado3(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
          
           Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AllTasks()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }
   Widget _crearBotonRedondeado2(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){

      

        
        if(route != null) {
         
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AddUser()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }


  // ignore: unused_element
  Widget _crearBotonRedondeado4(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: ()  {
        buildAlert(context);
        
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

   Widget _crearBotonRedondeado5(IconData icono, String texto, [String route]) {
    return GestureDetector(
      onTap: (){
        if(route != null) {
              Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MenuTennis1()),
                                      );
        }
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

   Widget _crearBotonRedondeado6(IconData icono, String texto, ) {
    return GestureDetector(
      onTap: (){
      
              Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AllUsers()),
                                      );
        
      },
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: GlassContainer(
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20.0),
              Icon(icono, color: Colors.white, size: 45.0),
              Text(texto, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              SizedBox(height: 20.0)
          ],),
        ),
      ),
    );
  }

buildAlert(BuildContext context)
  {
    YudizModalSheet.show(
    context: context,
    child: Container(
      
      decoration: BoxDecoration(
        
              color: Color.fromRGBO(23, 23, 23, 0.70),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color.fromRGBO(23, 23, 23, 0.21),
              )
            ),
      height: MediaQuery.of(context).size.height*0.2,
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Text("¿Desea Cerrar Sesión?", style: (
                                      TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      )
                                    ),),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton.icon(
                color: Colors.transparent,
                elevation: 0,
                onPressed: () async {
                  var id = localS.window.localStorage['id'];
         var usuario = localS.window.localStorage['usuario'];

         
                      String url = 'https://v2-api-bot.herokuapp.com/api/v1/user/logout';
                     
                      
                 

                  Map<String, dynamic> map = {

                        "id": id,
                  
                  };

                  final response = await http.post(url,
                      headers: {
                        'content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization':  'Bearer $usuario',
                      },
                      body: jsonEncode(map));
                  if (response.statusCode <= 205) {
                   
                    localS.window.localStorage.clear();

                     Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Login()),
                                      );
                  } else {
                    print(response.body.toString());
                    // throw Exception("Failed to load data");
                  }
                }, 
                icon: Icon(Icons.check_circle, color: Color(0xff00cf8d),), 
                label: Text("Confirmar", style: TextStyle(color: Colors.white),)),
                 RaisedButton.icon(
                color: Colors.transparent,
                elevation: 0,
                onPressed: ()  {
                 Navigator.pop(context);
                }, 
                icon: Icon(Icons.cancel, color: Colors.red,), 
                label: Text("Cancelar", style: TextStyle(color: Colors.white),)),
                
              ],
            )
          ],
        )
      ),
    ),
    direction: YudizModalSheetDirection.BOTTOM);
  }

  
}