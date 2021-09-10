
import 'package:bot_sneakers/src/Tiendas/Fendi.dart';
import 'package:bot_sneakers/src/Tiendas/Kawzone.dart';
import 'package:bot_sneakers/src/Tiendas/NikeMx.dart';
import 'package:bot_sneakers/src/Tiendas/funko.dart';
import 'package:bot_sneakers/src/Tiendas/gucci.dart';
import 'package:bot_sneakers/src/Tiendas/octoberveryownus.dart';
import 'package:bot_sneakers/src/Tiendas/ripndip.dart';
import 'package:bot_sneakers/src/Tiendas/thrasher.dart';
import 'package:bot_sneakers/src/pages/admin_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuTennis1 extends StatelessWidget {
  const MenuTennis1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

     _buildListGucci(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Gucci()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/gucci%20logo.jpg?alt=media&token=c3717229-f2c8-4e07-bcd4-0441fc456918'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 100,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }

  _buildListFendi(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){

                Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Fendi()),
                                      );
                
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/fendii.png?alt=media&token=6b73c1dd-c318-49c8-819e-79810cadf884'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 100,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }

  _buildListAdidas(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/adidas%20logo.jpg?alt=media&token=8c941063-a4e2-400a-a732-1d95e03ad72a'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 100,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }
   _buildListOctober(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){

                Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Octoberveryownus()),
                                      );
                
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/ovo%20logo.jpg?alt=media&token=3c9079b1-b309-4c90-9922-174ba6ac0744'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 80,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }
 

 
  _buildListRip(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Ripndip()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/ripndip%20logo.jpg?alt=media&token=48f2e38c-0c3c-4be4-99e0-ad9e261c0b1c'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 80,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                   

                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }

  _buildListTrasher(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Thrasher()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/trasher%20logo.jpg?alt=media&token=2afa003a-5a8d-422e-b436-31b82b67dd3e'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 80,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }

  _buildListFunko(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                  Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Funko()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/funko%20logo.jpeg?alt=media&token=1df380b0-c409-4739-b4a6-f9d68e5d16b9'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 80,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }

  _buildListKawzone(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Kawzone()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/kaws%20logoooo.jpg?alt=media&token=c0e7b78e-5850-4531-9358-804b5fcc0bd6'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 80,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                )
                )
                ),
            )
          ],
        ));
  }

     _buildListNike(String imgPath) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: (){
                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Nike()),
                                      );
              },
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/nike.jpg?alt=media&token=7e8d9183-1140-4b0a-b6a1-0b4f9f420cd3'),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Positioned(
               left: 100,
              top: 100,
              child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
            )
          ],
        ));
  }
    return Scaffold(
      
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          _imagenFondo(),
          Container(
            height: MediaQuery.of(context).size.height*0.08,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white,),
                  onPressed: (){
                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AdminPage()),
                                      );
                  },
                ),
                Text('Storage', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox()
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.1,
            child: Container(
            height: MediaQuery.of(context).size.height*0.92,
            width: MediaQuery.of(context).size.width,
            child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: ListView(
          children: [
           
                   Titulos(titulo: "Sneakers",),
                    Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                         
                             _buildListNike(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/nike.jpg?alt=media&token=7e8d9183-1140-4b0a-b6a1-0b4f9f420cd3',
                            ),
                            _buildListGucci(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/gucci%20logo.jpg?alt=media&token=c3717229-f2c8-4e07-bcd4-0441fc456918',
                            ),
                            _buildListAdidas(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/adidas%20logo.jpg?alt=media&token=8c941063-a4e2-400a-a732-1d95e03ad72a',
                            ),
                            
                        
                      ],
                    )),
                    Titulos(titulo: "Clothes",),
                    Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                             _buildListOctober(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/ovo%20logo.jpg?alt=media&token=3c9079b1-b309-4c90-9922-174ba6ac0744',
                            ),
                            _buildListFendi(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/fendii.png?alt=media&token=6b73c1dd-c318-49c8-819e-79810cadf884',
                            ),
                            _buildListRip(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/ripndip%20logo.jpg?alt=media&token=48f2e38c-0c3c-4be4-99e0-ad9e261c0b1c',
                            ),
                            _buildListTrasher(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/trasher%20logo.jpg?alt=media&token=2afa003a-5a8d-422e-b436-31b82b67dd3e',
                            ),
                            
                            
                        
                      ],
                    )),
                    Titulos(titulo: "Accessories",),
                    Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                             _buildListFunko(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/funko%20logo.jpeg?alt=media&token=1df380b0-c409-4739-b4a6-f9d68e5d16b9',
                            ),
                            _buildListKawzone(
                            'https://firebasestorage.googleapis.com/v0/b/sneakerbot-8f31c.appspot.com/o/kaws%20logo.jpg?alt=media&token=abbde897-939f-4267-a690-3cc066073443',
                            ),
                      ],
                    )),
          ],
        )
      ),
          )
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

class Titulos extends StatelessWidget {
    final String titulo;
    const Titulos({
      this.titulo,
      Key key,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            SizedBox(width: 15,),
            Text(titulo,
            style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                textStyle: TextStyle(color: Colors.white))),
          ],
        );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key key,
    @required this.context, this.imgPath, this.titulo, this.press,
  }) : super(key: key);

  final BuildContext context;
  final String imgPath, titulo;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            
            
             InkWell(
              onTap: press,
              child: Container(
              height: 200.0,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      )),
            ),
            ),
            Padding(
             padding: EdgeInsets.only(top: 50, bottom: 50, left: 40, right: 40),
             child: Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(titulo,
                        style: GoogleFonts.montserrat(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white))),
                    
                    SizedBox(height: 20.0),
                    
                  ],
                ))),
           )
          ],
        ));
  }
}

