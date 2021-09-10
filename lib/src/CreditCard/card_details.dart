
import 'dart:convert';
import 'dart:math';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:http/http.dart' as http;

class Country extends StatelessWidget {
  static const routeName = '/country1';

  @override
  Widget build(BuildContext context) {
    var usuario = localS.window.localStorage['usuario'];
     var id;
    final String key = '@SneaKer-BoT-ApI--@admin-API-BooT';
    final Map country = ModalRoute.of(context).settings.arguments;
      final cardname = TextEditingController();
      var cardname1;
      final paymentEmail = TextEditingController();
      var paymentEmail1;
      final cardYearExpiration = TextEditingController();
      var cardYearExpiration1;
      final cardMonthExpiration = TextEditingController();
      var cardMonthExpiration1;
      final cardNumber = TextEditingController(); 
      var cardNumber1;

      final credential = TextEditingController(); 
      var credential1;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF212239),
        centerTitle: true,
        title: Text(country['cardHolder']),
      ),
      body: Stack(
        children: [
          _imagenFondo(),
          Positioned(
            
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.15),
      
         
           child: Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
               
              ),
              color: Color(0xFF212239).withOpacity(0.7)
      ),

       
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[  
            Row(
        children: <Widget>[
          new Flexible(
            child: new TextField(

            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Nombre de la tarjeta",
              
              hintText: country['cardHolder'],
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              
            ),
            controller: cardname
            
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
              labelText: "Número de la tarjeta",
              hintText:   "**** **** **** "+ country['cardNumber'].substring( country['cardNumber'].length - 4),
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            controller: cardNumber,
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
              inputFormatters: [
                 LengthLimitingTextInputFormatter(3),
            ] ,
               keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "CVV",
              hintText:   "***",
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            controller: credential,
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
              labelText: "Correo de la tarjeta",
              hintText:    country['cardEmail'],
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
            controller: paymentEmail,
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
            ] ,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Año de expiración de tarjeta",
              hintText:   "****",
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),

            controller: cardYearExpiration,
            
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
              labelText: "Mes de expiración de tarjeta",
              hintText:    "**",
              labelStyle: TextStyle(color: Colors.white, fontSize: 16),
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
              
            ),

            controller: cardMonthExpiration,
            
          ),
          ),

          
        ],
      ),


       FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 80),
                            onPressed: () async {
                              
                              if(cardname.text == "")
                              {
                               cardname1 = country['cardHolder'];
                              }
                              else 
                              {
                                cardname1 = cardname.text;
                              }

                               if(cardNumber.text == "")
                              {
                               cardNumber1 = country['cardNumber'];
                              }
                              else 
                              {
                                cardNumber1 = cardNumber.text;
                              }

                              if(paymentEmail.text == "")
                              {
                               paymentEmail1 = country['cardEmail'];
                              }
                              else 
                              {
                                paymentEmail1 = paymentEmail.text;
                              }

                               if(cardYearExpiration.text == "")
                              {
                               cardYearExpiration1 = country['expirationYear'];
                              }
                              else 
                              {
                                cardYearExpiration1 = cardYearExpiration.text;
                              }

                               if(cardMonthExpiration.text == "")
                              {
                               cardMonthExpiration1 = country['expirationMonth'];
                              }
                              else 
                              {
                                cardMonthExpiration1 = cardMonthExpiration.text;
                              }

                              if(credential.text == "")
                              {
                               credential1 = country['credential_token'];
                              }
                              else 
                              {
                                credential1 = credential.text;
                              }


                              id = country['id'];


                              String url = 'https://v2-api-bot.herokuapp.com/api/v1/card';
                  print(url);
                  final claimSet = new JwtClaim(
                      issuer: 'teja',
                      subject: 'kleak',
                      audience: <String>[
                        'client1.example.com',
                        'client2.example.com'
                      ],
                      jwtId: _randomString(32),
                      otherClaims: <String, dynamic>{
                        "cardEmail": paymentEmail1,
                        "cardHolder": cardname1,
                        "cardNumber": cardNumber1,
                        "expirationMonth": cardMonthExpiration1,
                        "expirationYear":cardYearExpiration1,
                        "credential_token": credential1
                      },
                      maxAge: const Duration(minutes: 5));
                  final token = issueJwtHS256(claimSet, key);

                  Map<String, dynamic> map = {"token": token.trim(), "id":id};

                  final response = await http.put(url,
                      headers: {
                        'content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer $usuario',
                      },
                      body: jsonEncode(map));
                  if (response.statusCode <= 205) {
                    print(response.body.toString());
                     paymentEmail1.clear();
                    cardname.clear();
                    cardNumber.clear();
                    cardMonthExpiration.clear();
                    cardYearExpiration.clear();
                    credential.clear();
                  } else {
                    print(response.body.toString());
                    // throw Exception("Failed to load data");
                  }
                            },
                            child: Text(
                              "Editar",
                              style: TextStyle(color: Color(0xFF212239)),
                            ),
                            color: Colors.white,
                            shape: StadiumBorder(),
                          ),

                          SizedBox(height: 10,)
         
          
        
        

         
         
         
       

        
        
        ])

        )),
          )
        ],
      )

    );
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

class CountryDetailCard extends StatelessWidget {
  final String title;
  final MaterialColor color;
  CountryDetailCard({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}


String _randomString(int length) {
  const chars =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
  final rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  final buf = new StringBuffer();

  for (var x = 0; x < length; x++) {
    buf.write(chars[rnd.nextInt(chars.length)]);
  }
  return buf.toString();
}
