import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:photo_view/photo_view.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  
  Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}
int dia = int.parse(DateFormat('dd').format(DateTime.now())), mes = int.parse(DateFormat('MM').format(DateTime.now())), year = int.parse(DateFormat('yyyy').format(DateTime.now()));
bool fechaSeleccionada;
final myController = TextEditingController();
final myControllerDes = TextEditingController();
String hora;
bool calendario = true;
String mesSelc;

NumberFormat f = new NumberFormat("#,##0.00", "es_US");
class _CalendarState extends State<Calendar> {
  final db = FirebaseFirestore.instance;
  var date2;
  

  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight)
  {
    return TextStyle(color: Colors.white, fontWeight: fontWeight);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }


  @override
  void dispose() {
    
    super.dispose();
    _controller.dispose();
  }
   
  Widget calendar() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      
      
      child: TableCalendar(
               startingDayOfWeek: StartingDayOfWeek.monday,
               calendarController: _controller,
               calendarStyle: CalendarStyle(
                 weekdayStyle: dayStyle(FontWeight.normal),
                 weekendStyle: dayStyle(FontWeight.normal),
                 selectedColor: Colors.black,
                 todayColor: Colors.red.shade400,
                 
                 
               ),
               daysOfWeekStyle: DaysOfWeekStyle(
                 weekdayStyle: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                 )
               ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  centerHeaderTitle: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  )
                ),
                onDaySelected: (date, events, holidays) {
                  dia = date.day;
                  mes = date.month;
                  year = date.year;
                  
                  setState(() {
                   dia.toString();
                   mesSelc = mes.toString();
                   year.toString();
                   if(mes < 10)
                   {
                      
                     mesSelc = "0"+ mes.toString();
                     print(mesSelc);
                   }
                  });

                  },
             ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    
    
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF212239),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text("Calendario",
        style: TextStyle(fontSize: 18)
        ),
        SizedBox()
          ],
        )
      ),
      backgroundColor: Color(0xFF212239),
      body: Stack(
        children: [
          _imagenFondo(),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                                  height: MediaQuery.of(context).size.height*0.05,
                                  
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Calendario",
                                      style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                      CupertinoSwitch(
                                        
                                    value: calendario,
                                    onChanged: (bool value){
                                      setState(() {
                                        calendario = value;
                                        print(calendario);
                                      });
                                    },
                                  ),
                                    ],
                                  ),
                                ),
                ClipRect(
              child:  BackdropFilter(
                filter:  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                
                child:  Container(

                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  
                  
                 
                  child: Center(
                   child: calendario == true ? calendar() : SizedBox()
                  ),

                  
                ),
                
              ),
            ),
            Container(
                    height: MediaQuery.of(context).size.height*0.8,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(

                      
                      padding: EdgeInsets.all(18),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                     
                        StreamBuilder<QuerySnapshot>(

                          
                          
            stream: db.collection('ADIDAS_YEEZY').where("monthRelease", isEqualTo: mesSelc).where("dayRelease", isEqualTo: dia.toString()).limit(50).snapshots(),
            
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                
                    return Column(children: snapshot.data.docs.map<Widget>((doc) => _buildListItem(doc)).toList());
                
                
              } else {
                return SizedBox();
              }
            },
            
          ),


          
                        StreamBuilder<QuerySnapshot>(

                          
                          
            stream: db.collection('NIKE_USA').where("monthRelease", isEqualTo: mes.toString()).where("dayRelease", isEqualTo: dia.toString())
            .where("yearRelease", isEqualTo: year.toString()).limit(50).snapshots(),
            
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                
                    return Column(children: snapshot.data.docs.map<Widget>((doc) => _buildListItem2(doc)).toList());
                
                
              } else {
                return SizedBox();
              }
            },
            
          ),

          StreamBuilder<QuerySnapshot>(

                          
                          
            stream: db.collection('NIKE_MX').where("monthRelease", isEqualTo: mes.toString()).where("dayRelease", isEqualTo: dia.toString())
            .where("yearRelease", isEqualTo: year.toString()).limit(50).snapshots(),
            
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                
                    return Column(children: snapshot.data.docs.map<Widget>((doc) => _buildListItem2(doc)).toList());
                
                
              } else {
                return SizedBox();
              }
            },
            
          ),
         
            

          
                      ],
                      
                    )
                    
                 )
              ],
            )
          ),
          

          
        ],
      )
    );
  }


 


_editarInventario(BuildContext context, DocumentSnapshot doc) async {


    // ignore: deprecated_member_use
    return showDialog(
                      
                      context: context,
                      builder: (_) => NetworkGiffyDialog(

                          
                            image: Image.network(
                             '${doc.data()['image']}',
  
                              
                            ),
                            entryAnimation: EntryAnimation.BOTTOM,

                            title: Text(
                              
                              '${doc.data()['title']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                            ),
                            description: Text(
                              'Precio: \$${f.format(doc.data()['price'])} ${doc.data()['currency']}',
                              textAlign: TextAlign.center,
                            ),

                            onCancelButtonPressed: (){

                              showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              PhotoView(imageProvider: NetworkImage( '${doc.data()['image']}'))
                                             
                                             
                                            ],

                                            
                                          ),
                                                                      
                                        ),
                                        
                                      );
                            },
                            buttonCancelText:Text("Zoom"),

                            onOkButtonPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                          ));

  }


  _editarInventario2(BuildContext context, DocumentSnapshot doc) async {


    // ignore: deprecated_member_use
    return showDialog(
                      
                      context: context,
                      builder: (_) => NetworkGiffyDialog(

                          
                            image: Image.network(
                             '${doc.data()['img']}',
  
                              
                            ),
                            entryAnimation: EntryAnimation.BOTTOM,

                            title: Text(
                              
                              '${doc.data()['title']}',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                            ),
                            description: Text(
                              'Precio:\$ ${f.format(double.parse(doc.data()['price']))} ${doc.data()['region']}',
                              textAlign: TextAlign.center,
                            ),

                            onCancelButtonPressed: (){

                              showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              PhotoView(imageProvider: NetworkImage( '${doc.data()['image']}'))
                                             
                                             
                                            ],

                                            
                                          ),
                                                                      
                                        ),
                                        
                                      );
                            },
                            buttonCancelText:Text("Zoom"),

                            onOkButtonPressed: () {Navigator.of(context, rootNavigator: true).pop();},
                          ));

  }

  



  //builder de cards para inventario 
  _buildListItem(DocumentSnapshot doc) {

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Stack(
        children: [


      
       Container(
           margin: const EdgeInsets.only(),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
        ),
        height: 180.0,
      ),
    
Positioned(
           
            right: 15,
            bottom: 0.1,
            child: Container(
             
               child: InkWell(
                      onTap: () async {
                      _editarInventario2(this.context, doc);
                       },
            child:  ClipRRect(
           
                borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(400.0),
                topRight: const Radius.circular(40.0),
                bottomLeft: const Radius.circular(100.0),
                bottomRight: const Radius.circular(40.0),
              ),
             child: Image.network(
                      (
                        '${doc.data()['img']}'
                      ),
                      height: 260,
                      width: 290,
                      
                    )),
            
                ),)),

           
        
         
          Positioned(
            bottom:30.0,
            left: 20.0,
            child: Container(
              
               height: 20,
               width: 300,
              
              child: Text("${doc.data()['title']}",
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                ),
           
              
            )

            
            
          ),
  
           Positioned(
            
            bottom: 10.0,
            right: 60,
            child: Container(
              
              width: 300,
               
              child: Text("\$${f.format(double.parse(doc.data()['price']))} ",textAlign: TextAlign.right,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                ),
           
           
              
            )

            
            
          ),
          
      
        ]
        
      )
      
      
    );
    
  }


  
  //builder de cards para inventario 
  _buildListItem2(DocumentSnapshot doc) {

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
      child: Stack(
        children: [


      
       Container(
           margin: const EdgeInsets.only(),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
        ),
        height: 180.0,
      ),
    
Positioned(
           
            right: 15,
            bottom: 0.1,
            child: Container(
             
               child: InkWell(
                      onTap: () async {
                      _editarInventario(this.context, doc);
                       },
            child:  ClipRRect(
           
                borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(400.0),
                topRight: const Radius.circular(40.0),
                bottomLeft: const Radius.circular(100.0),
                bottomRight: const Radius.circular(40.0),
              ),
             child: Image.network(
                      (
                        '${doc.data()['image']}'
                      ),
                      height: 260,
                      width: 290,
                      
                    )),
            
                ),)),

           
        
         
          Positioned(
            bottom:30.0,
            left: 20.0,
            child: Container(
              
               height: 20,
               width: 300,
              
              child: Text("${doc.data()['title']}",
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                ),
           
              
            )

            
            
          ),
  
           Positioned(
            
            bottom: 10.0,
            right: 60,
            child: Container(
              
              width: 300,
               
              child: Text("\$${f.format(doc.data()['price'])} ${doc.data()['currency']}",textAlign: TextAlign.right,
                 style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
                ),
           
           
              
            )

            
            
          ),
          
      
        ]
        
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
