import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quetodo/Screens/events.dart';


class drawerScreen extends StatefulWidget {
  @override
  _drawerScreenState createState() => _drawerScreenState();
}



class _drawerScreenState extends State<drawerScreen> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent
    ));
    return  Container(
      padding: EdgeInsets.only(left: 20,top: 110, right: 20, bottom: 20),
      child: Column(
        children: [

          Align(
            alignment: Alignment.centerLeft,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                  NetworkImage('https://images.unsplash.com/photo-1590086782792-42dd2350140d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 20,),
                Text("Sam Baby" ,style: GoogleFonts.montserrat( fontWeight: FontWeight.w800, color: Colors.white, fontSize: 35),textAlign: TextAlign.left,),
                Text("saam.baby@outlook.com" ,style: GoogleFonts.lato( fontWeight: FontWeight.w700, color: Colors.white, fontSize: 16),textAlign: TextAlign.left,),



              ],
            ),

          ),



          SizedBox(height: 70,),
          InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () {
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.library_books,color:Colors.white,size: 20,),
                    onPressed: () {
                    }),
                Text("Daily Events" ,style: GoogleFonts.lato( fontWeight: FontWeight.w700, color: Color(0xfff2f2f2), fontSize: 17)),
              ],
            ),
          ),

          InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () {
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.event,color:Colors.white,size: 20,),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => events()));
                    }),
                Text("Monthly Events" ,style: GoogleFonts.lato( fontWeight: FontWeight.w700, color: Color(0xfff2f2f2), fontSize: 17)),
              ],
            ),
          ),

          InkWell(
            // When the user taps the button, show a snackbar.
            onTap: () {
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.notifications_active,color:Colors.white,size: 20,),
                    onPressed: () {
                    }),
                Text("Remainder " ,style: GoogleFonts.lato( fontWeight: FontWeight.w700, color: Color(0xfff2f2f2), fontSize: 17)),


              ],
            ),
          ),
          SizedBox(height: 285,),

          Row(
          children: [
            InkWell(
            onTap: () {
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.settings,color:Colors.white,size: 18,),
                    onPressed: () {
                    }),
                Text(" Settings" ,style: new TextStyle(fontFamily: 'Futura Book', fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18)),


              ],
            ),
          ),
            Text("  |" ,style: new TextStyle(fontFamily: 'Futura Book', fontWeight: FontWeight.w900, color: Color(0xfff2f2f2), fontSize: 18)),
            InkWell(
              // When the user taps the button, show a snackbar.
              onTap: () {
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.logout,color:Colors.white,size: 18,),
                      onPressed: () {
                      }),

                  Text("Log Out" ,style: new TextStyle(fontFamily: 'Futura Book', fontWeight: FontWeight.w900, color: Color(0xfff2f2f2), fontSize: 18)),


                ],
              ),
            ),],
          ),



        ],
      ),
    );
  }
}


