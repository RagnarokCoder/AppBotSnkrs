import 'dart:convert';
import 'package:bot_sneakers/src/pages/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AllUsers extends StatefulWidget {
  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
  final String token1 =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmUxN2IyZi03Yjk1LTQ3MDYtOGNjMS0wNTg2MDgyNzNmZWUiLCJuYW1lIjoiQ2hyaXN0aWFuIEF4ZWwgU2VycmFubyBTYW5kb3ZhbCIsImVtYWlsIjoic2Vyc2FuMi5jaHJpc3RpMWFuQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiQ2xpZW50IiwiZXhwaXJhdGlvbkRheSI6MTIsImV4cGlyYXRpb25Nb250aCI6MiwiZXhwaXJhdGlvblllYXIiOjIwMjIsImlhdCI6MTYxNTkyMjQxNSwiZXhwIjoxNjE4NTE0NDE1fQ.Zgq7DrslvsmIDeLE0faqLC2OQrZFwJbdHALwuA55W3g';

  getCountries() async {
    var url = 'https://v2-api-bot.herokuapp.com/api/v1/user/users';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhYmUxN2IyZi03Yjk1LTQ3MDYtOGNjMS0wNTg2MDgyNzNmZWUiLCJuYW1lIjoiQ2hyaXN0aWFuIEF4ZWwgU2VycmFubyBTYW5kb3ZhbCIsImVtYWlsIjoic2Vyc2FuMi5jaHJpc3RpMWFuQGdtYWlsLmNvbSIsInVzZXJUeXBlIjoiQWRtaW4iLCJleHBpcmF0aW9uRGF5IjoxMiwiZXhwaXJhdGlvbk1vbnRoIjoyLCJleHBpcmF0aW9uWWVhciI6MjAyMiwiaWF0IjoxNjE2MTExMDU5LCJleHAiOjE2MTg3MDMwNTl9.cDKEElOUnT26GZ-wAVcA9W5XRLLIwGOqOjNVxCJ1Gfk',
    });
    var r = json.decode(response.body);
    print(r);

    return json.decode(response.body)['users'];
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
              country['emai'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: !isSearching
            ? Text('Usuarios')
            : TextField(
                onChanged: (value) {
                  _filterCountries(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Buscar por Nombre",
                    hintStyle: TextStyle(color: Colors.white)),
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
          Container(
            height: MediaQuery.of(context).size.height*0.9,
        padding: EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 15),
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                        //Navigator.of(context).pushNamed(UserDetails.routeName,
                          //arguments: filteredCountries[index]);

                     
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(
                          vertical: 10), //separacion entre cards

                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 18),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                              children: <Widget>[
                              

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: Colors.black,
                                          spreadRadius: .1)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.person,
                                      color: Color(0xFF212239),
                                    ),
                                    
                                  ),
                                ),
                                
                            Container(
                                padding: EdgeInsets.only(top: 10),
                               child: Text(
                                  filteredCountries[index]['name'],
                                  style: TextStyle(fontSize: 14),
                                )),
                            Icon(Icons.arrow_right, color: Colors.black, size: 32,)
                              ])),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
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
