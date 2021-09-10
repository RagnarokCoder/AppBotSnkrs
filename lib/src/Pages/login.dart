import 'dart:ui';
import 'package:bot_sneakers/src/pages/admin_page.dart';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:bot_sneakers/src/Animation/FadeAnimation.dart';
import 'package:bot_sneakers/src/api/api_service.dart';
import 'package:bot_sneakers/src/model/Progresshud.dart';
import 'package:bot_sneakers/src/model/login_model.dart';
import 'package:bot_sneakers/src/model/mac_model.dart';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:uuid/uuid.dart';

import 'home_page.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final myController = TextEditingController();
final myController2 = TextEditingController();
final db = FirebaseFirestore.instance;
final scaffoldKey = GlobalKey<ScaffoldState>();
String token;
String id;
bool click = false;
bool verificacion = true;
String mensaje = "";


class _LoginState extends State<Login> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;

  LoginRequestModel requestModel;
  MacRequestModel requestModel2;
  bool isApiCallProcess = false;

   sesiones(){

   APIService apiService = new APIService();

    apiService.login2(requestModel2).then((value) async {
      if (value.error == "Client") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }

      else{
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminPage()),
        );
      }
    });
    
  }

  @override
  void initState() {
    

    var uuid = Uuid();

    id = uuid.v4();

    var usuario = localS.window.localStorage['usuario'];
    if(usuario is String )
    {
      sesiones();
    }

    else{
      print("oajd");
    }

    super.initState();
    requestModel = new LoginRequestModel();
    requestModel2 = new MacRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: login(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget login(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: _pagina2(context),
        )
        
        );
  }

  Widget _pagina2(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Material(
        child: InkWell(
          onTap: () {
            click = true;
            setState(() {
              
            });
          },
          child: Container(
            child: ClipRRect(
              
              child: _imagenFondo2(),
            ),
            ),
        )
    ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                     click == true ? FadeAnimation(
                  1,
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.5,
                    padding: EdgeInsets.symmetric(vertical: 38, horizontal: 28),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(color: Colors.black, fontSize: 32)
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.email = input,
                            validator: (input) => !input.contains("@")
                                ? "El Correo debe ser valido"
                                : null,
                            decoration: new InputDecoration(
                                hintText: "Email",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(height: 20),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.password = input,
                            validator: (input) => input.length < 3
                                ? "La contraseña debe de ser mayor que 3 caracteres"
                                : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                                color: Colors.black.withOpacity(0.4),
                                icon: Icon(hidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () async {

                              

                              requestModel.mac = id;

                              if (validateandSave()) {
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .login(requestModel)
                                    .then((value) async {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  localS.window.localStorage['usuario'] =
                                      value.token;

                                      

                                  localS.window.localStorage['id'] = id;

                                  if (value.usuario == "Client") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                    );
                                  } 

                                  if (value.usuario == "Admin") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AdminPage()),
                                    );
                                  }
                                  print(value.error);
                                  
                                  setState(() {
                                    verificacion = value.succes;
                                    mensaje = value.error;
                                    print(verificacion);
                                  });
                                });
                                print(requestModel.toJson());
                                
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.black,
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                  )): 
                  Center(
                    child: InkWell(
                      onTap: (){
                        click = true;
            setState(() {
              
            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
                    height: MediaQuery.of(context).size.height*0.2,
                    
                    child: Text("God King Bot",
                    style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                    ),
                  )
                    )
                  ),
                  click == true ? Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height*0.1,
                    color: verificacion==false ? Colors.white.withOpacity(0.7):Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        verificacion==false ? Text("$mensaje", 
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        ): SizedBox(),
                        verificacion==false ? Icon(Icons.error_outline, color: Colors.red, size: 22,): SizedBox()
                      ],
                    )
                  ):SizedBox()
                  ],
                ),
              )
            
                  
            ],
          ),
        )
        
        );
  }

  bool validateandSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }


 

  


  Widget _imagenFondo2() {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage('assets/snkrsback.jpg'), fit: BoxFit.fill),
      ),
      child: ClipRRect(
        // make sure we apply clip it properly
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
      ),
    );
  }

  
}
