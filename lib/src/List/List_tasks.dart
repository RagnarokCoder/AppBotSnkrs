

import 'dart:convert';
import 'package:bot_sneakers/src/Details/task_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/prefer_universal/html.dart' as localS;
class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {

  var usuario = localS.window.localStorage['usuario'];
  List countries = [];
  List filteredCountries = [];
  bool isSearching = false;
 
      

  getCountries() async {
   var url = 'https://v2-api-bot.herokuapp.com/api/v1/task';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $usuario',
    });
    var r = json.decode(response.body);
    print(r);
   
   return json.decode(response.body)['tasks'];
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
              country['product']['title'].toLowerCase().contains(value.toLowerCase()))
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
         
            Text('Tasks',
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
                     Navigator.of(context).pushNamed(TaskDetails.routeName,
                      arguments: filteredCountries[index]);

                    if(filteredCountries[index]['status'].contains("not")){
                      print("asdasd");

                    }
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
                          "Producto:",
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)
                        
                        ),
                        Text(
                          filteredCountries[index]['product']['title'].toString(),
                          
                          style: TextStyle(fontSize: 14),
                        ),

                          SizedBox(height: 10.0),

                          Text(
                          "Status:",
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)
                        
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text(
                          filteredCountries[index]['status'],
                       style: TextStyle(
                        color: Colors.black,
                        
                        fontSize: 14.0)
                        
                        ),
                        )
                         

                           
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