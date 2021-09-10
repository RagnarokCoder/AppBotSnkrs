import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:bot_sneakers/src/Animation/FadeAnimation.dart';
import 'package:bot_sneakers/src/model/Progresshud.dart';
import 'package:bot_sneakers/src/model/signin_model.dart';

import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:universal_html/prefer_universal/html.dart' as localS;
class AddProfile extends StatefulWidget {
  AddProfile({Key key}) : super(key: key);

  @override
  _AddProfileState createState() => _AddProfileState();
}

var usuario = localS.window.localStorage['usuario'];
String _mySelection;
String mensaje="";
bool verificacion = false;
final firstname = TextEditingController();
final lastname = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
final country = TextEditingController();
final phoneNumber = TextEditingController();
final address = TextEditingController();
final apt = TextEditingController(); //departamento
final city = TextEditingController();
final zipcode = TextEditingController();
String idProfileGroup;
String estado;
String estado2;
bool sameBillingAddress = true;
final billingFirstName = TextEditingController();
final billingLastName = TextEditingController();
final billingAddress = TextEditingController();
final billingApt = TextEditingController();
final billingCity = TextEditingController();
final billingCountry = TextEditingController();
final billingZipcode = TextEditingController();
final billingPhoneNumber = TextEditingController();

final db = FirebaseFirestore.instance;
final scaffoldKey = GlobalKey<ScaffoldState>();
String t, t2, t3;
String token1;


class _AddProfileState extends State<AddProfile> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  List data = [];
  SigninRequestModel requestModel;
  bool isApiCallProcess = false;

  Future<String> getSWData() async {
   var url = 'https://v2-api-bot.herokuapp.com/api/v1/card';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $usuario',
    });
    var r =json.decode(response.body)['cards'];
    setState(() {
      data = r;
    });

    print(r);

    return "Sucess";
  }


  @override
  void initState() {
    super.initState();
     this.getSWData();
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

  _getCustomAppBar() {
    return AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(),
            Text(
              "Nuevo Perfil",
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.person_add),
          ],
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFF212239));
  }

  Widget _pagina2(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              _imagenFondo(),
              verificacion==true ? Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height*0.1,
                    color: verificacion==true ? Colors.white.withOpacity(0.7):Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        verificacion==true ? Text(verificacion==true?"Perfil Registrado!":"Error!", 
                        style: TextStyle(color: verificacion==true? Colors.green.shade600: Colors.red.shade600, fontSize: 18),
                        ): SizedBox(),
                        verificacion==true ? Icon(verificacion==true?Icons.check:Icons.error, color: Colors.green.shade600, size: 22,): SizedBox()
                      ],
                    )
                  ):SizedBox(),
              FadeAnimation(
                  1,
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height*0.9,
                      padding:
                          EdgeInsets.symmetric(vertical: 38, horizontal: 28),
                      margin:
                          EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: Offset(0, 10),
                                blurRadius: 20)
                          ]),
                      child: ListView(children: [
                        Form(
                          key: globalFormKey,
                          child: Column(
                            children: <Widget>[
                              
                              BuilderTextField(
                                requestModel: requestModel,
                                titulo: "Nombre",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: firstname,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                requestModel: requestModel,
                                titulo: "Apellido",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: lastname,
                              ),
                              SizedBox(height: 12),
                              new TextFormField(
                                controller: email,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (input) => requestModel.email = input,
                                validator: (input) => !input.contains("@")
                                    ? "El Correo debe ser valido"
                                    : null,
                                decoration: new InputDecoration(
                                    hintText: "Correo Electronico",
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
                              SizedBox(height: 12),
                              new TextFormField(
                                controller: password,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (input) =>
                                    requestModel.password = input,
                                validator: (input) => input.length < 3
                                    ? "La contraseña debe de ser mayor que 3 caracteres"
                                    : null,
                                obscureText: hidePassword,
                                decoration: new InputDecoration(
                                  hintText: "Contraseña",
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
                                height: 12,
                              ),
                              BuilderTextField(
                                requestModel: requestModel,
                                titulo: "País",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: country,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Número de celular",
                                  icon: Icon(Icons.phone, color: Colors.black),
                                  controller: phoneNumber),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Dirección",
                                  icon: Icon(Icons.map, color: Colors.black),
                                  controller: address),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Departamento",
                                  icon: Icon(Icons.apartment,
                                      color: Colors.black),
                                  controller: apt),
                                  SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Ciudad",
                                  icon: Icon(Icons.location_city,
                                      color: Colors.black),
                                  controller: city),
                                  SizedBox(
                                height: 12,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Codigo Postal",
                                  icon: Icon(Icons.supervised_user_circle,
                                      color: Colors.black),
                                  controller: zipcode),
                                  SizedBox(
                                height: 12,
                              ),
                             Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),

                                // dropdown below..
                                child: DropdownButton<String>(
                                    value: estado,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    hint: Text("State", 
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    underline: SizedBox(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        estado = newValue;
                                        print(estado);
                                       
                                      });
                                    },
                                    items: <String>[
                                     "Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Chiapas", "Chihuahua", "Coahuila", "Colima", "Distrito Federal", "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "México", "Michoacán", "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList()),
                                ),

                                

                                  SizedBox(
                                height: 12,
                              ),
                             

                                

                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),

                                // dropdown below..
                                child: DropdownButton(
                                  hint: Text("Card", 
                                  
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    items: data.map((item) {
                                      return new DropdownMenuItem(
                                        child: new Text(    "**** **** **** "+ item['cardNumber'].substring( item['cardNumber'].length - 4),
),
                                        value: item['id'].toString(),
                                      );
                                    }).toList(),
                                    onChanged: (newVal) {
                                      setState(() {
                                        _mySelection = newVal;
                                        print(_mySelection);
                                      });
                                    },
                                    value: _mySelection,
                                  ),
                                ),
                                 SizedBox(
                                height: 12,
                              ),
                                 Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),

                                // dropdown below..
                                child: DropdownButton<String>(
                                    value: idProfileGroup,
                                    hint: Text("Group", 
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    underline: SizedBox(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        idProfileGroup = newValue;

                                       
                                      });
                                    },
                                    items: <String>[
                                      'NIKE_MX',
                                      'NIKE_USA',
                                      'OCTOBERS_VERY_OWN_US',
                                      'ADIDAS_YEEZY'
                                      'BAPE',
                                      'FENDI',
                                      'FUNKO',
                                      'GUCCI',
                                      'KAWZONE',
                                      'RIPNDIP',
                                      'SUPREME'
                                      'THRASHER',
                                  
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList()),
                                ),

                                 SizedBox(
                                height: 12,
                              ),

                                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Same BillingAdress",
                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                      ),
                                      CupertinoSwitch(
                                    value: sameBillingAddress,
                                    onChanged: (bool value){
                                      setState(() {
                                        sameBillingAddress = value;
                                        print(sameBillingAddress);
                                      });
                                    },
                                  ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                height: 12,
                              ),



                                  Column(
    children: <Widget>[
      if (sameBillingAddress == false)
        Column(
          children: <Widget>[

             BuilderTextField(
                                requestModel: requestModel,
                                titulo: "Nombre",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: billingFirstName,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                requestModel: requestModel,
                                titulo: "Apellido",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: billingLastName,
                              ),

                              SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Dirección",
                                  icon: Icon(Icons.map, color: Colors.black),
                                  controller: billingAddress),

                                  SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Departamento",
                                  icon: Icon(Icons.apartment,
                                      color: Colors.black),
                                  controller: billingApt),
                                  SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Ciudad",
                                  icon: Icon(Icons.location_city,
                                      color: Colors.black),
                                  controller: billingCity),
                                  SizedBox(
                                height: 12,
                              ),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),

                                // dropdown below..
                                child: DropdownButton<String>(
                                    value: estado2,
                                    hint: Text("Card", 
                                  
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 30,
                                    underline: SizedBox(),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        estado2 = newValue;
                                        print(estado2);
                                       
                                      });
                                    },
                                    items: <String>[
                                     "Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Chiapas", "Chihuahua", "Coahuila", "Colima", "Distrito Federal", "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "México", "Michoacán", "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas"
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList()),
                                ),

                                SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                requestModel: requestModel,
                                titulo: "País",
                                icon: Icon(Icons.supervised_user_circle,
                                    color: Colors.black),
                                controller: billingCountry,
                              ),

                                       SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Codigo Postal",
                                  icon: Icon(Icons.supervised_user_circle,
                                      color: Colors.black),
                                  controller: billingZipcode),

                                   SizedBox(
                                height: 12,
                              ),
                              BuilderTextField(
                                  requestModel: requestModel,
                                  titulo: "Número de celular",
                                  icon: Icon(Icons.phone, color: Colors.black),
                                  controller: billingPhoneNumber),

                
            
          ],
         ),
            
          ],
        ),
 
                                  
                              
                              
                            ],
                          ),

                          
                        )

                       
                      ]))),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height*0.02,
                        left: MediaQuery.of(context).size.width/4,
                        child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 80),
              onPressed: () async {

                if(sameBillingAddress == false){

                   if (firstname.text.length < 1 ||
                        lastname.text.length < 1 ||
                        email.text.length < 1 ||
                        password.text.length < 1 ||
                        country.text.length < 1 ||
                        phoneNumber.text.length < 1 ||
                        address.text.length < 1 ||
                        apt.text.length < 1 ||
                        city.text.length < 1 ||
                        estado.length < 1 ||
                        zipcode.text.length < 1||
                        billingFirstName.text.length < 1 ||
                        billingLastName.text.length < 1  ||
                        billingAddress.text.length < 1 ||
                        billingApt.text.length < 1 ||
                        billingCity.text.length < 1 ||
                        estado2.length < 1 ||
                        billingCountry.text.length < 1  ||
                        billingZipcode.text.length < 1 ||
                        billingPhoneNumber.text.length < 1       ) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Información Incorrecta",
                        desc: "Llena todos los datos",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Cerrar",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true).pop(),
                            width: 120,
                          )
                        ],
                      ).show();
                    } 

                    else{

                  
                      String url = 'https://v2-api-bot.herokuapp.com/api/v1/profile';
                     
                      
                 

                  Map<String, dynamic> map = {

                        "firstName": firstname.text,
                        "lastName": lastname.text,
                        "email": email.text,
                        "password": password.text,
                        "country": country.text,
                        "phoneNumber": phoneNumber.text,
                        "address": address.text,
                        "apt": apt.text,
                        "city": city.text,
                        "state": estado,
                        "zipcode": zipcode.text,
                        "idProfileGroup": idProfileGroup,
                        "sameBillingAddress": false,
                        "idCard":_mySelection.toString(),
                        "billingFirstName":billingFirstName.text,
                        "billingLastName":billingLastName.text,
                        "billingAddress":billingAddress.text,
                        "billingApt":billingApt.text,
                        "billingCity":billingCity.text,
                        "billingState":estado2,
                        "billingCountry":billingCountry.text,
                        "billingZipcode":billingZipcode.text,
                        "billingPhoneNumber":billingPhoneNumber.text
                  };

                  final response = await http.post(url,
                      headers: {
                        'content-type': 'application/json',
                        'Accept': 'application/json',
                      },
                      body: jsonEncode(map));
                  if (response.statusCode <= 205) {
                    setState(() {
                      verificacion = true;
                      
                      print(verificacion);


                       firstname.text = "";
                        lastname.text = "";
                        email.text="";
                        password.text="";
                         country.text="";
                         phoneNumber.text="";
                        address.text="";
                         apt.text="";
                       city.text="";
                       zipcode.text="";
                        
                        billingFirstName.text="";
                        billingLastName.text="";
                        billingAddress.text="";
                        billingApt.text="";
                        billingCity.text="";
                        estado2="";
                        billingCountry.text="";
                        billingZipcode.text="";
                        billingPhoneNumber.text = "";
                    });
                    print(response.body.toString());
                  } else {
                    setState(() {
                      verificacion = false;
                      print(verificacion);
                    });
                    print(response.body.toString());
                    // throw Exception("Failed to load data");
                  }

                    }

                }


                if(sameBillingAddress == true)
                {
                    if (firstname.text.length < 1 ||
                        lastname.text.length < 1 ||
                        email.text.length < 1 ||
                        password.text.length < 1 ||
                        country.text.length < 1 ||
                        phoneNumber.text.length < 1 ||
                        address.text.length < 1 ||
                        apt.text.length < 1 ||
                        city.text.length < 1 ||
                        estado.length < 1 ||
                        zipcode.text.length < 1 ) {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Información Incorrecta",
                        desc: "Llena todos los datos",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Cerrar",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true).pop(),
                            width: 120,
                          )
                        ],
                      ).show();
                    } 

                    else{
                   
                      String url = 'https://v2-api-bot.herokuapp.com/api/v1/profile';
       
                   
       

                  Map<String, dynamic> map = {
                    
                        "firstName": firstname.text,
                        "lastName": lastname.text,
                        "email": email.text,
                        "password": password.text,
                        "country": country.text,
                        "phoneNumber": phoneNumber.text,
                        "address": address.text,
                        "apt": apt.text,
                        "city": city.text,
                        "state": estado,
                        "zipcode": zipcode.text,
                        "idProfileGroup": idProfileGroup,
                        "idCard":_mySelection.toString(),
                        "sameBillingAddress": true,
                        "billingFirstName":firstname.text,
                        "billingLastName":lastname.text,
                        "billingAddress":address.text,
                        "billingApt":apt.text,
                        "billingCity":city.text,
                        "billingState":estado2,
                        "billingCountry":country.text,
                        "billingZipcode":zipcode.text,
                        "billingPhoneNumber":phoneNumber.text

                  };

                  final response = await http.post(url,
                      headers: {
                        'content-type': 'application/json',
                        'Accept': 'application/json',
                      
                      },
                      body: jsonEncode(map));
                  if (response.statusCode <= 205) {
                    setState(() {
                      verificacion = true;
                      print(verificacion);
                    });
                    print(response.body.toString());
                  } else {
                    setState(() {
                      verificacion = false;
                      print(verificacion);
                    });
                    print(response.body.toString());
                    // throw Exception("Failed to load data");
                  }
                    


                    }

                }
               

               Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                    verificacion=false;
                    
                });
                });


                
              },
              child: Text(
                "Registrar",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xFF212239),
              shape: StadiumBorder(),
            ),
                      )
            ],
          ),
        ));
  }

   Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/snkrsback.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

}

class BuilderTextField extends StatelessWidget {
  final Icon icon;
  final String titulo;
  final TextEditingController controller;

  const BuilderTextField(
      {final Key key,
      @required this.requestModel,
      this.icon,
      this.titulo,
      this.controller})
      : super(key: key);

  final SigninRequestModel requestModel;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onSaved: (input) => requestModel.nombre = input,
      validator: (input) => input.length < 1 ? "No debe de ser vacio" : null,
      decoration: InputDecoration(
          hintText: titulo,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor.withOpacity(0.2),
            ),
          ),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          prefixIcon: icon),
    );
  }
}
