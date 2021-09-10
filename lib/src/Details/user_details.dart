import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:intl/intl.dart';


class UserDetails extends StatelessWidget {
  static const routeName = '/UserDetails';

  @override
  Widget build(BuildContext context) {
    final Map taskDetails = ModalRoute.of(context).settings.arguments;
    DateTime _currentdate = DateTime.now();
    String _formatdate = DateFormat.yMMMd().format(_currentdate);
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(taskDetails['name']),
      ),
      body: Container(
          
          child: Container(
           
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(children: <Widget>[
               

                 new Center(
      
        child: Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.black,
              size: 100.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),


            
          
        
      ),

      Container(
          padding: EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             border: Border.all(color: Colors.black)
          ),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: taskDetails['name'],
            ),
            
          ),
        ),
        
               SizedBox(height: 15),

        Container(
          padding: EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             border: Border.all(color: Colors.black)
          ),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: taskDetails['email'],
            ),
            
          ),
        ),

                   Column(
                            children: <Widget>[
                              Row(children: <Widget>[
                                Expanded(
                                  child: Text('Fecha : $_formatdate'),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      CupertinoRoundedDatePicker.show(
                                        context,
                                        fontFamily: "Mali",
                                        initialDatePickerMode:
                                            CupertinoDatePickerMode.date,
                                        minimumYear: 2021,
                                        maximumYear: 2025,
                                        onDateTimeChanged: (dateTime) {
                                          
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.date_range,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ])
                            ],
                          ),

                          



                
              ]))),
    );
  }
}
