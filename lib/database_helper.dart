import 'dart:async';

import 'package:quetodo/models/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'models/todo.dart';

class DatabaseHelper{

Future <Database> database() async {
  return openDatabase(
    // set path to the database
    join(await getDatabasesPath(), 'todo.db'),
    //creating database
    onCreate: (db, version) async{
      await db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, desc TEXT)");
      await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY, title TEXT, isDone INTEGER,task_id INTEGER)");

      return db;
    },

      version:1,);

    }

    Future< int> insertTask( Task task) async{
  int taskId=0;
  Database _db = await database();
  await _db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) => {
    taskId=value}
  );

    }

Future< int> deleteTask( int id) async{

  Database _db = await database();

  await _db.rawDelete(" DELETE FROM tasks WHERE id='$id'");
  await _db.rawDelete(" DELETE FROM todo WHERE id='$id'");

}

    Future<void>UpdateTaskTitle (int id, String title)async{
  Database db= await database();
  await db.rawUpdate("UPDATE tasks SET title= '$title' WHERE id='$id'");
    }
Future<void>UpdateTaskDesc (int id, String desc)async{
  Database db= await database();
  await db.rawUpdate("UPDATE tasks SET desc= '$desc' WHERE id='$id'");
}

Future<void>UpdateTodo (int id, int isdone)async{
  Database db= await database();
  await db.rawUpdate("UPDATE todo SET isDone= '$isdone' WHERE id='$id'");
}

    Future <void> insertTodo( Todo todo) async{
  Database _db= await database();
  await _db.insert('todo', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }


    Future<List<Task>> getTasks() async {
  Database _db = await database();
  List<Map<String, dynamic>> taskMap = await _db.query('tasks');
  return List.generate(taskMap.length, (index) {
    return Task(id: taskMap[index]['id'],
                title: taskMap[index]['title'],
                 desc: taskMap[index]['desc']);
  });
    }
Future<List<Todo>> getTodo(int taskId) async {
  Database _db = await database();
  List<Map<String, dynamic>> todoMap = await _db.rawQuery("SELECT * FROM todo WHERE task_id = $taskId");
  return List.generate(todoMap.length, (index) {
    return Todo(id: todoMap[index]['id'],
        title: todoMap[index]['title'],
        isDone: todoMap[index]['isDone'],
        task_id: todoMap[index]['task_id']);

  });
}


}

