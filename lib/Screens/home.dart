import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quetodo/Screens/taskpage.dart';
import 'package:quetodo/database_helper.dart';
import 'package:quetodo/widgets/scrollbehavior.dart';
import 'package:quetodo/widgets/taskcard.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}
// sam
class _homeState extends State<home> {
  DatabaseHelper _db= DatabaseHelper() ;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 0;
  bool isOpen = false;
  Size get size => MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));
    return AnimatedPositioned(
      duration: Duration(milliseconds: 350),
      top: isOpen ? 0.15 * size.height : 0,
      bottom: isOpen ? 0.15 * size.height : 0,
      left: isOpen ? 0.55 * size.width : 0,
      right: isOpen ? -0.4 * size.width : 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            color: Color(0xfff2f2f2),
            padding: EdgeInsets.symmetric(vertical: isOpen?25:50, horizontal: 30),
            child:  Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          isOpen
                              ? IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Color(0xff414a4c),
                              size: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                isOpen = false;
                              });
                            },
                          )
                              : IconButton(
                              icon: Icon(
                                Icons.list,
                                color: Color(0xff414a4c),
                                size: 28,
                              ),
                              onPressed: () {
                                setState(() {
                                  isOpen = true;
                                  Timer(Duration(milliseconds: 20),
                                          () {
                                        SystemChrome
                                            .setSystemUIOverlayStyle(
                                            SystemUiOverlayStyle
                                                .light);
                                      });
                                });
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Color(0xff414a4c),
                                size: 25,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: isOpen?5:40,),
                    Text(
                      "Hi SamBaby Welcome to Quetodo!",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900,
                          color: Color(0xff211551),
                          fontSize: 45),

                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: isOpen?5:20,),
                    Expanded(
                        child: FutureBuilder(
                          initialData: [],
                          future: _db.getTasks(),
                          builder: (context, snapshot){
                            return ScrollConfiguration(
                              behavior: NoGlowBehaviour(),
                              child: ListView.builder(
                                  itemCount:snapshot.data.length,
                                  itemBuilder:(context, index){
                                    return GestureDetector(
                                        onTap: (){

                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskPage(
                                            task: snapshot.data[index],

                                          ))).then((value){
                                            setState(() {

                                            });
                                          });
                                        },
                                        child: TaskCard(title: snapshot.data[index].title,desc: snapshot.data[index].desc,));
                                  }),);
                          },
                        )
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,

                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 7,
                            // changes position of shadow
                          ),
                        ],

                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.note_add,
                          color: Colors.white,
                          size: 25,
                        ),

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> TaskPage(task: null,))).then((value){
                            setState(() {

                            });
                          });
                        },),
                    ))


              ],
            ),
          ),
        ),
      ),
    );
  }
}
