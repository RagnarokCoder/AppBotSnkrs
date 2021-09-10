

import 'dart:convert';
import 'package:bot_sneakers/src/Adds/add_profile.dart';
import 'package:bot_sneakers/src/Details/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AllProfiles extends StatefulWidget {
  @override
  _AllProfilesState createState() => _AllProfilesState();
}

class _AllProfilesState extends State<AllProfiles> {

 
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
 final String token1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmUxN2IyZi03Yjk1LTQ3MDYtOGNjMS0wNTg2MDgyNzNmZWUiLCJuYW1lIjoiQ2hyaXN0aWFuIEF4ZWwgU2VycmFubyBTYW5kb3ZhbCIsImVtYWlsIjoic2Vyc2FuMi5jaHJpc3RpMWFuQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZXhwaXJhdGlvbkRheSI6MTIsImV4cGlyYXRpb25Nb250aCI6MiwiZXhwaXJhdGlvblllYXIiOjIwMjIsImlhdCI6MTYxNTkyMjQxNSwiZXhwIjoxNjE4NTE0NDE1fQ.Zgq7DrslvsmIDeLE0faqLC2OQrZFwJbdHALwuA55W3g';

  getCountries() async {
   var url = 'https://v2-api-bot.herokuapp.com/api/v1/profile/NIKE_MX';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
    });
    var r = json.decode(response.body);
    print(r);
   
   return json.decode(response.body)['profiles'];
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
              country['firstName'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF212239),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            Text('Perfiles',
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
                    hintText: "Buscar Por Producto",
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
            top: MediaQuery.of(context).size.height*0.05,
            child: Container(
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                    Navigator.of(context).pushNamed(ProfileEdit.routeName,
                      arguments: filteredCountries[index]);

                 
                  print(filteredCountries[index]);
                    },
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 15),//separacion entre cards
                       color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                         Text(
                          "Nombre:",
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)
                        
                        ),
                        Text(
                          filteredCountries[index]['firstName']+" " + filteredCountries[index]['lastName'],
                       
                          style: TextStyle(fontSize: 16),
                        ),

                          SizedBox(height: 10.0),

                          Text(
                          "Profile Group:",
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)
                        
                        ),
                         

                           Text(
                        

                     filteredCountries[index]['idProfileGroup'].toString(),

                          style: TextStyle(fontSize: 16),
                        ),
                 ]),
                 Icon(Icons.arrow_forward, size: 25,)
                              ],
                            )),
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
            builder: (context) => AddProfile(),
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