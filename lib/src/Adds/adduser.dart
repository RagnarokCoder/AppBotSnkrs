import 'dart:ui';
import 'package:bot_sneakers/src/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:bot_sneakers/src/Animation/FadeAnimation.dart';
import 'package:bot_sneakers/src/model/Progresshud.dart';
import 'package:bot_sneakers/src/model/signin_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universal_html/prefer_universal/html.dart' as localS;

class AddUser extends StatefulWidget {
  AddUser({Key key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

final correo = TextEditingController();
final password = TextEditingController();
final nombre = TextEditingController();
final db = FirebaseFirestore.instance;
final scaffoldKey = GlobalKey<ScaffoldState>();
String t, t2, t3;

var usuario = localS.window.localStorage['usuario'];


class _AddUserState extends State<AddUser> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;

  SigninRequestModel requestModel;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModel = new SigninRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: login(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  DateTime _currentdate = DateTime.now();
  @override
  // ignore: override_on_non_overriding_member
  Widget login(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _getCustomAppBar(),
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _pagina2(context),
          ],
        ));
  }


  _getCustomAppBar(){
 return AppBar(
          title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         
          children: <Widget>[
            SizedBox(),
            
            Text(
              "Nuevo Usuario",style: TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
            Icon(
              Icons.person_add
            ),
          ],
        ),
          

         
          
          
          elevation: 0.0,
          backgroundColor:  Color(0xFF212239)
        );

  
}

  Widget _pagina2(BuildContext context) {

    String _formatdate = DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          
          child: Stack(
            children: <Widget>[
              _imagenFondo2(),
              FadeAnimation(
                  1,
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.6,
                    padding: EdgeInsets.symmetric(vertical: 38, horizontal: 28),
                    margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.7),
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
                            height: 12,
                          ),
                         
                          new TextFormField(
                            controller: nombre,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.nombre = input,
                            validator: (input) => input.length < 3
                                ? "El Nombre debe de ser mayor que 3 caracteres"
                                : null,
                            decoration: new InputDecoration(
                              hintText: "Nombre",
                              hintStyle: TextStyle(color: Colors.black),
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
                                Icons.supervised_user_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          new TextFormField(
                            controller: correo,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.email = input,
                            validator: (input) => !input.contains("@")
                                ? "El Correo debe ser valido"
                                : null,
                            decoration: new InputDecoration(
                                hintText: "Correo Electronico",
                                hintStyle: TextStyle(color: Colors.black),
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
                            controller: password,
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => requestModel.password = input,
                            validator: (input) => input.length < 3
                                ? "La contraseña debe de ser mayor que 3 caracteres"
                                : null,
                            obscureText: hidePassword,
                            decoration: new InputDecoration(
                              hintText: "Contraseña",
                              hintStyle: TextStyle(color: Colors.black),
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text('Fecha : $_formatdate',
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: IconButton(
                                    onPressed: () {
                                      CupertinoRoundedDatePicker.show(
                                        context,
                                        fontFamily: "Mali",
                                        initialDatePickerMode:
                                            CupertinoDatePickerMode.date,
                                        minimumYear: 2021,
                                        maximumYear: 2025,
                                        onDateTimeChanged: (dateTime) {
                                          setState(() {
                                            print(_currentdate.day);
                                            requestModel.day =
                                                _currentdate.day.toString();
                                            requestModel.month =
                                                _currentdate.month.toString();
                                            requestModel.year =
                                                _currentdate.year.toString();
                                            _currentdate = dateTime;
                                          });
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ), 
                                )
                              ])
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () async {
                              if (validateandSave()) {
                                setState(() {
                                  isApiCallProcess = true;
                                });

                                APIService apiService = new APIService();
                                apiService
                                    .registroo(requestModel)
                                    .then((value) async {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                });

                                print(requestModel.toJson());
                              }
                            },
                            child: Text(
                              "Registrar",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Color(0xFF212239),
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ));
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/snkrsback.jpg"),
          fit: BoxFit.cover,
        ),
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

class APIServiceRegistro {
  // ignore: missing_return
  Future<SigninResponseModel> registro(SigninRequestModel requestModel) async {
    String url = "https://bot-sneaker-api.herokuapp.com/api/v1/user/register";

    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $usuario',
        },
        body: jsonEncode(requestModel));
    if (response.statusCode == 201) {

      nombre.clear();
      correo.clear();
      password.clear();
      
      return SigninResponseModel.fromJson(json.decode(response.body));
    } else {
      print(response.body.toString());
      // throw Exception("Failed to load data");
    }
  }
}