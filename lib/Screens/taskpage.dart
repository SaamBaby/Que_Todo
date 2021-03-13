import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quetodo/database_helper.dart';
import 'package:quetodo/models/task.dart';
import 'package:quetodo/models/todo.dart';

import 'package:quetodo/widgets/TodoWidget.dart';
import 'package:quetodo/widgets/scrollbehavior.dart';

class TaskPage extends StatefulWidget {
  final Task task;
  TaskPage({@required this.task});
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String _textvalue ="";
  String _descvalue="";
  DatabaseHelper _db= DatabaseHelper() ;
  int  _taskId= 0;
  int taskdone=0;

  FocusNode _titleFocus;
  FocusNode _descriptionFocus;
  FocusNode _todoFocus;
  bool _contentVisible= false;

  @override
  void initState(){
      if(widget.task!= null){

        _textvalue=widget.task.title;
        _descvalue=widget.task.desc;
        _taskId=widget.task.id;
        _contentVisible= true;
      }
      _titleFocus=FocusNode();
      _descriptionFocus=FocusNode();
      _todoFocus=FocusNode();
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        color: Color(0xfff2f2f2),
        padding: EdgeInsets.only(top: 60,right: 30,left: 30, bottom: 10),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff414a4c),
                          size: 25,
                        ),
                      ),
                    ),
                    Expanded(child:
                    TextField(
                      focusNode: _titleFocus,
                      onSubmitted: (value) async {

                        if(value!=""){

                          if(widget.task==null){
                            //  creating a new entry to the database
                            DatabaseHelper _dbHelper= DatabaseHelper();

                            Task _newTask = Task(title: value);
                            _taskId=await _dbHelper.insertTask(_newTask);
                            setState(() {
                              _contentVisible= true;
                              _textvalue= value;
                            });
                            print("new task named '$value' has been created");
                          }else{
                            _db.UpdateTaskTitle(_taskId, value);

                          }
                              _descriptionFocus.requestFocus();

                        }
                      },
                      controller: TextEditingController()..text = _textvalue,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          hintText: "Enter the Task Title",
                          hintStyle: GoogleFonts.nunito( fontWeight: FontWeight.w700, color: Colors.black54, fontSize: 25),
                          border: InputBorder.none),
                      style: GoogleFonts.nunito( fontWeight: FontWeight.w700,  color: Color(0xff211551), fontSize: 25),
                    )
                    )

                  ],
                ),
                SizedBox(height: 30,),
                Visibility(
                  visible: _contentVisible,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: TextField(
                      onSubmitted: (value){
                        if(value!= ""){
                          _db.UpdateTaskDesc(_taskId, value);
                          setState(() {
                            _descvalue= value;
                          });
                        }
                        else{

                        }
                        _todoFocus.requestFocus();
//                      }
                      },
                      controller: TextEditingController()..text= _descvalue,
                      textCapitalization: TextCapitalization.sentences,

                      decoration: InputDecoration(
                          hintText: "Enter the Description of the task here ",
                          hintStyle: GoogleFonts.nunito( fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 20),
                          border: InputBorder.none),
                      style: GoogleFonts.nunito( fontWeight: FontWeight.w700,  color: Color(0xff211551), fontSize: 20),

                    ),
                  ),
                ),
                Visibility(
                  visible: _contentVisible,
                  child: FutureBuilder(
                    initialData: [],
                    future: _db.getTodo(_taskId),
                    builder: (context, snapshot){
                      return ScrollConfiguration(
                        behavior: NoGlowBehaviour(),
                        child: Expanded(
                          child: ListView.builder(
                              itemCount:snapshot.data.length,
                              itemBuilder:(context, index){
                                return GestureDetector(
                                    onTap: () async{
                                   print(snapshot.data[index].isDone);
                                   if(snapshot.data[index].isDone==0){
                                     await _db.UpdateTodo(snapshot.data[index].id,1);}
                                   else{await _db.UpdateTodo(snapshot.data[index].id,0);}
                                       setState(() {

                                       });
                                    },
                                    child: TodoWidget(title: snapshot.data[index].title,isdone: snapshot.data[index].isDone == 0?false:true));
                              }),
                        ),);
                    },
                  ),
                ),



                Visibility(
                  visible: _contentVisible,
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              color: Colors.deepPurpleAccent,
                              width: 1.5
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),

                      ),

                      Expanded(

                        child: TextField(
                          onSubmitted: (value) async {


                            if(value!=""){
                              // check if the task is numm
                              if(widget.task!=null){
                                DatabaseHelper dbHelper= DatabaseHelper();
                                Todo _todo = Todo(title: value,
                                    isDone: 0,
                                    task_id: widget.task.id);
                                print(_todo.task_id);
                                await dbHelper.insertTodo(_todo);
                                setState(() {

                                });

                              }else{

                                print("upadate the excisting task");
                              }


                            }

                          },
                          controller: TextEditingController()..text = "",
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                              hintText: "Enter first  todo item",
                              hintStyle: GoogleFonts.nunito( fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 18),
                              border: InputBorder.none),
                          style: GoogleFonts.nunito( fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 18),
                        ),)
                    ],
                  ),
                )




              ],
            ),

            Visibility(
              visible: _contentVisible,
              child: Positioned(
                bottom: 24,
                right: 24,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,

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
                        Icons.delete,
                        color: Colors.white,
                        size: 25,
                      ),

                      onPressed: ()async{
                        if(_taskId!=null)
                          {
                             await _db.deleteTask(_taskId);
                             Navigator.pop(context);
                          }
                        setState(() {
                          
                        });

                      },),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


