import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TodoWidget extends StatelessWidget {
  final String title;
  final  bool isdone;
  const TodoWidget({Key key, this.title, this.isdone});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(

          children: [
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isdone?Colors.deepPurpleAccent:Colors.transparent,
                border: Border.all(
                    color: Colors.deepPurpleAccent,
                    width: 1.5
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Image(
                image: AssetImage('asset/images/check_icon.png'),
                color: isdone?Colors.white:Colors.transparent,
              ),
            ),

            Text(
              title ?? "Unnamed Task",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  color: isdone?Colors.grey:Color(0xff211551),
                  decoration: isdone?TextDecoration.lineThrough:TextDecoration.none,
                  fontSize: 18),
                  textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }




}