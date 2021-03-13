import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String desc;

  const TaskCard({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 34),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Unnamed Task",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w900,
                    color: Color(0xff211551),
                    fontSize: 25),

                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  desc ?? "No Description Added",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                      fontSize: 17,
                      height: 1.5),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )),
    );
  }
}
