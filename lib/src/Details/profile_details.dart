import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;



class ProfileEdit extends StatefulWidget {
  
  static const routeName = '/country';

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {


    String _mySelection ;
     List data = [];

   Future<String> getSWData() async {
   var url = 'https://v2-api-bot.herokuapp.com/api/v1/card';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmUxN2IyZi03Yjk1LTQ3MDYtOGNjMS0wNTg2MDgyNzNmZWUiLCJuYW1lIjoiQ2hyaXN0aWFuIEF4ZWwgU2VycmFubyBTYW5kb3ZhbCIsImVtYWlsIjoic2Vyc2FuMi5jaHJpc3RpMWFuQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZXhwaXJhdGlvbkRheSI6MTIsImV4cGlyYXRpb25Nb250aCI6MiwiZXhwaXJhdGlvblllYXIiOjIwMjIsImlhdCI6MTYxNTkyMjQxNSwiZXhwIjoxNjE4NTE0NDE1fQ.Zgq7DrslvsmIDeLE0faqLC2OQrZFwJbdHALwuA55W3g',
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
    
  }


  @override
  Widget build(BuildContext context) {

    
    
    final Map country = ModalRoute.of(context).settings.arguments;
    final firstname = TextEditingController();
    final lastname = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final country1 = TextEditingController();
    final phoneNumber = TextEditingController();
    final address = TextEditingController();
    final apt = TextEditingController(); //departamento
    final city = TextEditingController();
    final state = TextEditingController();
    final zipcode = TextEditingController();

    final billingFirstName = TextEditingController();
    final billingLastName = TextEditingController();
    final billingAddress = TextEditingController();
    final billingApt = TextEditingController();
    final billingCity = TextEditingController();
    final billingState = TextEditingController();
    final billingCountry = TextEditingController();
    final billingZipcode = TextEditingController();
    final billingPhoneNumber = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF212239),
        centerTitle: true,
        title: Text(country['firstName'] + " " + country['lastName']),
      ),
      body: Container(
          child: Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                  color: Color(0xFF212239)),
              child: ListView(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Nombre",
                                  hintText: country['firstName'],
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  hintStyle: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                controller: firstname),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Apellido",
                                hintText: country['lastName'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: lastname,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Contraseña",
                                hintText: "***********",
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: address,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Número de telefono",
                                hintText: country['phoneNumber'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: phoneNumber,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Correo",
                                hintText: country['email'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: email,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                              ],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Codigo Postal",
                                hintText: country['zipcode'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: zipcode,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.white,
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Dirección",
                                hintText: country['address'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: address,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Ciudad",
                                hintText: country['city'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: city,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "País",
                                hintText: country['country'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: country1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Estado",
                                hintText: country['state'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: state,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          new Flexible(
                            child: new TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: "Departamento",
                                hintText: country['apt'],
                                labelStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              controller: apt,
                            ),
                          ),
                        ],
                      ),
                //      Container(
                  //      padding:
                    //        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      //  decoration: BoxDecoration(
                        //    color: Colors.grey[200],
                          //  borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                      //  child: DropdownButton(
                        //  items: data.map((item) {
                        //    return new DropdownMenuItem(
                         //     child: new Text(
                          //      "**** **** **** " +
                           //         item['cardNumber'].substring(
                            //            item['cardNumber'].length - 4),
                            //  ),
                             // value: item['id'].toString(),
                            //);
                         // }).toList(),
                         // onChanged: (newVal) {
                          //  setState(() {
                           //   _mySelection = newVal;
                            //  print(_mySelection);
                            //});
                          //},
                          //value: _mySelection,
                       // ),
                      //),
                      SizedBox(
                                height: 12,
                              ),
                      Column(
                        children: <Widget>[
                          if (country['sameBillingAddress'] == false)
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingFirstName",
                                          hintText: country['billingFirstName'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingFirstName,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingLastName",
                                          hintText: country['billingLastName'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingLastName,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingAddress",
                                          hintText: country['billingAddress'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingApt",
                                          hintText: country['billingApt'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingApt,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingCity",
                                          hintText: country['billingCity'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingCity,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingState",
                                          hintText: country['billingState'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingState,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingCountry",
                                          hintText: country['billingCountry'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingCountry,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingZipcode",
                                          hintText: country['billingZipcode'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingZipcode,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "billingPhoneNumber",
                                          hintText:
                                              country['billingPhoneNumber'],
                                          labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        controller: billingPhoneNumber,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                        ],
                      ),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                        onPressed: () async {
                          bool billing;
                          if (country['sameBillingAddress'].toString() ==
                              "true") {
                            billing = true;
                          } else {
                            billing = false;
                          }
                          if (billing == true) {
                            if (firstname.text == "") {
                              firstname.text = country['firstName'];
                            }
                            if (lastname.text == "") {
                              lastname.text = country['lastName'];
                            }
                            if (password.text == "") {
                              password.text = country['password'];
                            }
                            if (phoneNumber.text == "") {
                              phoneNumber.text = country['phoneNumber'];
                            }
                            if (email.text == "") {
                              email.text = country['email'];
                            }
                            if (zipcode.text == "") {
                              zipcode.text = country['zipcode'];
                            }
                            if (address.text == "") {
                              address.text = country['address'];
                            }
                            if (city.text == "") {
                              city.text = country['city'];
                            }
                            if (country1.text == "") {
                              country1.text = country['country'];
                            }
                            if (state.text == "") {
                              state.text = country['state'];
                            }
                            if (apt.text == "") {
                              apt.text = country['apt'];
                            }

                            if(_mySelection == null){
                             _mySelection = country['idCard'];
                               print("sd");
                            }
                            var id;
                            id = country['id'];

                            String url =
                                'https://v2-api-bot.herokuapp.com/api/v1/profile/$id';
                         

                            Map<String, dynamic> map = {
                              "firstName": firstname.text,
                              "lastName": lastname.text,
                              "email": email.text,
                              "password": password.text,
                              "country": country1.text,
                              "phoneNumber": phoneNumber.text,
                              "address": address.text,
                              "apt": apt.text,
                              "city": city.text,
                              "state": state.text,
                              "zipcode": zipcode.text,
                              "idProfileGroup": country['idProfileGroup'],
                              "sameBillingAddress": billing,
                              "idCard":_mySelection.toString(),
                            };

                            final response = await http.put(url,
                                headers: {
                                  'content-type': 'application/json',
                                  'Accept': 'application/json',
                                },
                                body: jsonEncode(map));
                            if (response.statusCode <= 205) {
                              print(response.body.toString());
                            } else {
                              print(response.body.toString());
                              // throw Exception("Failed to load data");
                            }
                          } else {
                            if (firstname.text == "") {
                              firstname.text = country['firstName'];
                            }
                            if (lastname.text == "") {
                              lastname.text = country['lastName'];
                            }
                            if (password.text == "") {
                              password.text = country['password'];
                            }
                            if (phoneNumber.text == "") {
                              phoneNumber.text = country['phoneNumber'];
                            }
                            if (email.text == "") {
                              email.text = country['email'];
                            }
                            if (zipcode.text == "") {
                              zipcode.text = country['zipcode'];
                            }
                            if (address.text == "") {
                              address.text = country['address'];
                            }
                            if (city.text == "") {
                              city.text = country['city'];
                            }
                            if (country1.text == "") {
                              country1.text = country['country'];
                            }
                            if (state.text == "") {
                              state.text = country['state'];
                            }
                            if (apt.text == "") {
                              apt.text = country['apt'];
                            }

                            if (billingFirstName.text == "") {
                              billingFirstName.text =
                                  country['billingFirstName'];
                            }
                            if (billingLastName.text == "") {
                              billingLastName.text = country['billingLastName'];
                            }

                            if (billingAddress.text == "") {
                              billingAddress.text = country['billingAddress'];
                            }

                            if (billingApt.text == "") {
                              billingApt.text = country['billingApt'];
                            }

                            if (billingCity.text == "") {
                              billingCity.text = country['billingCity'];
                            }
                            if (billingState.text == "") {
                              billingState.text = country['billingState'];
                            }
                            if (billingCountry.text == "") {
                              billingCountry.text = country['billingCountry'];
                            }
                            if (billingZipcode.text == "") {
                              billingZipcode.text = country['billingZipcode'];
                            }
                            if (billingPhoneNumber.text == "") {
                              billingPhoneNumber.text =
                                  country['billingPhoneNumber'];
                            }
                             if(_mySelection == null){
                               print("sd");
                             _mySelection = country['idCard'];
                            }

                            var id;
                            id = country['id'];

                            String url =
                                'https://v2-api-bot.herokuapp.com/api/v1/profile/$id';

                            Map<String, dynamic> map = {
                              "firstName": firstname.text,
                              "lastName": lastname.text,
                              "email": email.text,
                              "password": password.text,
                              "country": country1.text,
                              "phoneNumber": phoneNumber.text,
                              "address": address.text,
                              "apt": apt.text,
                              "city": city.text,
                              "state": state.text,
                              "zipcode": zipcode.text,
                              "idProfileGroup": country['idProfileGroup'],
                              "sameBillingAddress": billing,
                              "billingFirstName": billingFirstName.text,
                              "billingLastName": billingLastName.text,
                              "billingAddress": billingAddress.text,
                              "billingApt": billingApt.text,
                              "billingCity": billingCity.text,
                              "billingState": billingState.text,
                              "billingCountry": billingCountry.text,
                              "billingZipcode": billingZipcode.text,
                              "billingPhoneNumber": billingPhoneNumber.text,
                                "idCard":_mySelection.toString(),
                            };

                            final response = await http.put(url,
                                headers: {
                                  'content-type': 'application/json',
                                  'Accept': 'application/json',
                                },
                                body: jsonEncode(map));
                            if (response.statusCode <= 205) {
                              print(response.body.toString());
                            } else {
                              print(response.body.toString());
                              // throw Exception("Failed to load data");
                            }
                          }
                        },
                        child: Text(
                          "Editar",
                          style: TextStyle(color: Color(0xFF212239)),
                        ),
                        color: Colors.white,
                        shape: StadiumBorder(),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ])
              ]))),
    );
  }
}
