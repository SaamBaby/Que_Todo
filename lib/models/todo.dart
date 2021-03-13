class Todo{
  final int id;
  final String title;
  final int isDone;
  final int task_id;

  Todo({this.id, this.title, this.isDone,this.task_id});

  Map<String, dynamic> toMap(){
    return{
      'id':id,
      "title":title,
      'isDone':isDone,
      'task_id':task_id
    };


  }


}