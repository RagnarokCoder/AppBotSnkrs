

import 'dart:convert';
import 'package:bot_sneakers/src/pages/admin_page.dart';
import 'package:universal_html/prefer_universal/html.dart' as localS;
import 'package:bot_sneakers/src/CreditCard/card_details.dart';
import 'package:bot_sneakers/src/CreditCard/card_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ListCards extends StatefulWidget {
  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
var usuario = localS.window.localStorage['usuario'];
  getCountries() async {
    print(usuario);
   var url = 'https://v2-api-bot.herokuapp.com/api/v1/card';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $usuario',
    });
    var r = json.decode(response.body);
    print(r);
     print(r['cardNameHolder']);
    return json.decode(response.body)['cards'];
    }

  @override
  void initState() {
    getCountries().then((body) {
      setState(() {
        countries = filteredCountries = body;
      });
    });
    super.initState();
  }

  void _filterCountries(value) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country['cardHolder'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //es para quitar el boton de regreso que se pone en automatico
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AdminPage()),
                                      )
          },
        ), 
        backgroundColor: Color(0xFF212239),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text('Tarjetas',
            style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            !isSearching
            ? SizedBox()
            : Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Buscar Por Nombre",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14)),
              ),
            )
          ],
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      filteredCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
        
      ),
      
      body: Stack(
        children: [
          _imagenFondo(),
          Positioned(
            top: MediaQuery.of(context).size.height*0.08,
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10),
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                     Navigator.of(context).pushNamed(Country.routeName,
                      arguments: filteredCountries[index]);

                  print(filteredCountries[index]);
                    },
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                        Text(
                          filteredCountries[index]['cardHolder'],
                       
                          style: TextStyle(fontSize: 18),
                        ),
                         Text(
                        

                      "**** **** **** "+ filteredCountries[index]['cardNumber'].substring( filteredCountries[index]['cardNumber'].length - 4),

                          style: TextStyle(fontSize: 18),
                        ),

                           Text(
                        

                     filteredCountries[index]['cardEmail'],

                          style: TextStyle(fontSize: 18),
                        ),
                        
                 ]),
                 Icon(Icons.arrow_forward, size: 25,)
                              ],
                            ) 
                            
                            ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
    context,
    MaterialPageRoute(
            builder: (context) => CreditCard(),
    ));
        },
        label: Text('Agregar', style: TextStyle(color: Colors.white),),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF212239)
      ),
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