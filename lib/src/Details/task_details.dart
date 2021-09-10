


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

NumberFormat f = new NumberFormat("#,##0.00", "es_US");
class TaskDetails extends StatelessWidget {
  static const routeName = '/TaskDetails';

  @override
  Widget build(BuildContext context) {
  
    final Map taskDetails = ModalRoute.of(context).settings.arguments;
    final String status = taskDetails['status'].toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF212239),
        centerTitle: true,
        title: Text(taskDetails['product']['title'],
        style: TextStyle(fontSize: 18)
        ),
      ),
      body: Center(
        child: Container(
        
        padding: EdgeInsets.all(10),
      
         
           child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                   ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
          taskDetails['product']['image'],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.3,
        ),
          ),
 SizedBox(height: 20.0),
          
          Text(
                            taskDetails['product']['title'],
                       
                          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),


                           Text(
                        
                             "\$"+
                     f.format(double.parse(taskDetails['product']['price'].toString()))+" "+taskDetails['product']['currency'],

                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),


                        
SizedBox(height: 25.0),

                        Text(
                          "Status:",
                       style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0)
                        
                        ),
                         
SizedBox(height: 10.0),

                           Container(
                             height: MediaQuery.of(context).size.height*0.08,
                             
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                status=="Comprando ..."? Text(
                             status,
                          style: TextStyle(fontSize: 16, color: Colors.blue.shade800),
                        ):Text(
                             status,
                          style: TextStyle(fontSize: 16, color: Colors.red.shade600),
                        ),
                        status=="Comprando ..."?SizedBox(
                child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade800),
        ),
                height: 20.0,
                width: 20.0,
              ):Icon(Icons.error_outline, color: Colors.red.shade600,)
                               ],
                             ),
                           ),

        SizedBox(height: 20.0),
                       

                         
                 ]) ),),
      )

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


