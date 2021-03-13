import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class events extends StatefulWidget {
  bool isOpen= true;
//  events({Key key, this.isOpen}):super(key: key);

  @override
  _eventsState createState() => _eventsState();


}

class _eventsState extends State<events> {
  double xOffset = 0;
  double yOffset = 0;

  double scaleFactor = 0;


  Size  get size =>  MediaQuery.of(context).size;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent
    ));
    return  AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top:widget.isOpen?0.18*size.height:0,
      bottom: widget.isOpen?0.136*size.height:0,
      left: widget.isOpen?0.525*size.width:0,
      right: widget.isOpen?-0.5*size.width:0,

      child: Material(
        borderRadius: BorderRadius.circular(45),
        elevation: 8,
        color: Colors.white,
        child: Column(
          children: [
            Container(

              margin: EdgeInsets.symmetric( vertical: widget.isOpen?25:50, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isOpen?IconButton(
                    icon: Icon(Icons.arrow_back,color:Color(0xff414a4c),size: 25,),
                    onPressed: () {

                      setState(() {
                        widget.isOpen= false;


                      });
                    },
                  ):IconButton(
                      icon: Icon(Icons.menu_open_rounded,color:Colors.black,size: 28,),
                      onPressed: () {
                        setState(() {
                          widget.isOpen= true;
                          Timer(Duration(milliseconds: 20), () {
                            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
                          });
                        });
                      }),

                  IconButton(
                      icon: Icon(Icons.search,color:Color(0xff596a71),size: 25,),
                      onPressed: () {
                      }),
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
