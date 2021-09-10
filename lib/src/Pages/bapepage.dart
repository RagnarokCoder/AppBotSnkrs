import 'package:bot_sneakers/src/Globals/header.dart';
import 'package:flutter/material.dart';

class Bape extends StatefulWidget {
  @override
  _BapeState createState() => _BapeState();
}

class _BapeState extends State<Bape> {
    String producto="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      
      home: Scaffold(

        
        
        body: Stack(
          children: [
         
            
        _imagenFondo(),
     
            
        Positioned(

      // width: MediaQuery.of(context).size.width/2,
            
        child:  ListView(
         
           
          
            children: <Widget>[
               
                Header(),
              
              

              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    height: 180.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 10.0)
                        ]),
                  ),
                  Container(
                    
                    padding: const EdgeInsets.only(left: 0.100, top: 30.0),
                    child: Image.network(
                      (
                        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/Bape-Logo.png?alt=media&token=275a1493-ddd1-42c5-a266-2ef35577762e'
                      ),
                      height: 170,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                       
                        Padding(
                             padding: const EdgeInsets.only(left: 40.0,bottom: 22),
                        child: Text(
                          
                          'Kids',
                          style: TextStyle(
                            
                              color: Colors.green[300],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600),
                        )),
                       
                        SizedBox(
                          height: 15.0,
                        ),

                         new GestureDetector(
                        onTap: (){

                          producto = "BAPE_KIDS";

                          Navigator.pushNamed(context, 'bapeproduct', arguments: {'producto':producto});
                         
                        },
                       child: new Container(
                         
                          height: 40.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.black,
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Ver Productos',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                children: [

                                  
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                         ),
                      ],
                    ),
                  ),
                ],
              ),



              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    height: 180.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 10.0)
                        ]),
                  ),
                  Container(
                    
                    padding: const EdgeInsets.only(left: 0.100, top: 30.0),
                    child: Image.network(
                      (
                        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/Bape-Logo.png?alt=media&token=275a1493-ddd1-42c5-a266-2ef35577762e'
                      ),
                      height: 170,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                       
                        Padding(
                             padding: const EdgeInsets.only(left: 10.0,bottom: 22),
                        child: Text(
                          
                          'Women',
                          style: TextStyle(
                            
                              color: Colors.pink[300],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600),
                        )),
                       
                        SizedBox(
                          height: 15.0,
                        ),

                         new GestureDetector(
                        onTap: (){

                          producto = "BAPE_WOMEN";

                          Navigator.pushNamed(context, 'bapeproduct', arguments: {'producto':producto});
                         
                        },
                       child: new Container(
                         
                          height: 40.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.black,
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Ver Productos',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                children: [

                                  
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                         ),
                      ],
                    ),
                  ),
                ],
              ),



Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    height: 180.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      
                        shape: BoxShape.rectangle,
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 10.0)
                        ]),
                  ),
                  Container(
                    
                    padding: const EdgeInsets.only(left: 0.100, top: 30.0),
                    child: Image.network(
                      (
                        'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/Bape-Logo.png?alt=media&token=275a1493-ddd1-42c5-a266-2ef35577762e'
                      ),
                      height: 170,
                      width: 140,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150.0, top: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                       
                        Padding(
                             padding: const EdgeInsets.only(left: 40.0,bottom: 22),
                        child: Text(
                          
                          'Men',
                          style: TextStyle(
                            
                              color: Colors.blue[300],
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600),
                        )),
                       
                        SizedBox(
                          height: 15.0,
                        ),

                         new GestureDetector(
                        onTap: (){

                          producto = "BAPE_MEN";

                          Navigator.pushNamed(context, 'bapeproduct', arguments: {'producto':producto});
                         
                        },
                       child: new Container(
                         
                          height: 40.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:Colors.black,
                          ),
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Ver Productos',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                children: [

                                  
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    alignment: PlaceholderAlignment.middle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                         ),
                      ],
                    ),
                  ),
                ],
              ),




              

              


            

              
              

              
             
            
            ],
          ),),
          ])
      ),
    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.network(
        ("https://cutewallpaper.org/21/urban-art-wallpaper/Graffiti-Audrey-Hepburn-Wallpaper-iPhone-in-2019-Graffiti-.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }





}