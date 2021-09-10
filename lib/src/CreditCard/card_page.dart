import 'dart:convert';
import 'dart:math';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:bot_sneakers/src/CreditCard/credit_card_form.dart';
import 'package:bot_sneakers/src/CreditCard/credit_card_model.dart';
import 'package:bot_sneakers/src/CreditCard/credit_card_widget.dart';
import 'package:bot_sneakers/src/List/List_Cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:jaguar_jwt/jaguar_jwt.dart';

void main() => runApp(CreditCard());

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewCard(),
    );
  }
}

class NewCard extends StatefulWidget {
  @override
  _NewCardState createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  String cardNumber = '';
  bool verificacion = false;
   final TextEditingController emailcontroller =
      TextEditingController();
  String cardHolderName = '';
  String cvvNumber = '';
  String expiryDate = '';
  String email = '';
  bool showBackView = false;
var usuario = localS.window.localStorage['usuario'];

  // ignore: todo
  // TODO: guardar en variables de entornos ...
  final String key = '@SneaKer-BoT-ApI--@admin-API-BooT';

  void onCreditCardModel(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      cardHolderName = creditCardModel.cardHolderName;
      expiryDate = creditCardModel.expiryDate;
      cvvNumber = creditCardModel.cvvCode;
      showBackView = creditCardModel.isCvvFocused;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(
            builder: (context) => ListCards(),
    ));
              },
            ),
            Text('Agregar Tarjeta',
            style: TextStyle(color: Colors.white),
            ),
            
            Icon(Icons.credit_card, color: Colors.white,),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF212239),
      ),
      body: Stack(
        children: [
          _imagenFondo(),
          
          SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            verificacion==true ? Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: MediaQuery.of(context).size.height*0.1,
                    color: verificacion==true ? Colors.white.withOpacity(0.7):Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        verificacion==true ? Text(verificacion==true?"Tarjeta Registrada!":"Error!", 
                        style: TextStyle(color: verificacion==true? Colors.green.shade600: Colors.red.shade600, fontSize: 18),
                        ): SizedBox(),
                        verificacion==true ? Icon(verificacion==true?Icons.check:Icons.error, color: Colors.green.shade600, size: 22,): SizedBox()
                      ],
                    )
                  ):
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              height: 210,
              cardHolderName: cardHolderName,
              cvvCode: cvvNumber,
              
              showBackView: showBackView,
              cardBgColor: Color(0xFF212239),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              animationDuration: Duration(milliseconds: 1200),
            ),
             Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextFormField(
                controller: emailcontroller,
                validator: (input) => input.length > 1
                                ? "Correo no valido"
                                : null,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                     borderSide: const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
                  labelText: 'Correo Electronico',
                  hintText: 'Sapphire@admin.com',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white)
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  onCreditCardModelChange: onCreditCardModel,
                  cursorColor: Colors.red,
                  themeColor: Colors.black,
                ),
              ),
            ),
            
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 80),
              onPressed: () async {
                print(expiryDate.split("/"));
                if (cardNumber.length < 1 ||
                    expiryDate.length < 1 ||
                    cvvNumber.length < 1 ||
                    cardHolderName.length < 1) {
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
                } else {
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
                        "paymentEmail":emailcontroller.text,
                        "cardNameHolder": cardHolderName.trim(),
                        "cardNumber": cardNumber,
                        "cardMonthExpiration": expiryDate.split('/')[0],
                        "cardYearExpiration": expiryDate.split('/')[1],
                        "cardCVV": cvvNumber
                      },
                      maxAge: const Duration(minutes: 5));
                  final token = issueJwtHS256(claimSet, key);

                  Map<String, dynamic> map = {"token": token.trim()};

                  final response = await http.post(url,
                      headers: {
                        'content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer $usuario',
                      },
                      body: jsonEncode(map));
                  if (response.statusCode <= 205) {
                    print(response.body.toString());
                    emailcontroller.clear();
                    cardHolderName ="";
                    cardNumber = "";
                    expiryDate = "" ;
                    expiryDate = "";
                    cvvNumber ="";
                    //alerta correcto
                    setState(() {
                      verificacion=true;
                    });
                    print("Correcto");
                     
                  } else {
                    print(response.body.toString());
                    setState(() {
                      verificacion=false;
                    });
                    // throw Exception("Failed to load data");
                    // alerta error
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
            SizedBox(height: MediaQuery.of(context).size.height*0.1,)
          ],
        ),
      ),
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
