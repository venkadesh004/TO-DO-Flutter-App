import 'package:flutter/material.dart';
import 'package:my_first_own_app/main.dart';
import 'package:my_first_own_app/constants.dart';

class TaskManager extends StatefulWidget {

  final Color appBarColor;
  final List<String> taskDaily;
  final List<String> taskWeekly;
  final List<String> taskMonthly;
  final int indexNumber;
  
  TaskManager(this.taskDaily, this.taskWeekly, this.taskMonthly, this.appBarColor, this.indexNumber, {Key? key}) : super(key: key);

  @override
  State<TaskManager> createState() => _TaskManagerState(appBarColor);
}

class _TaskManagerState extends State<TaskManager> {

  
  Color appBarColor;

  _TaskManagerState(this.appBarColor); 

  @override
  Widget build(BuildContext context) {

    TextEditingController task = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: appBarColor,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyStatelessWidget(widget.taskDaily, widget.taskWeekly, widget.taskMonthly))),
        ),
        title: const Text(
          "Create New Task",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: task,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task Name",
                  hintStyle: TextStyle(
                    color: appBarColor
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description",
                  hintStyle: TextStyle(
                    color: appBarColor
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: appBarColor
              ),
              onPressed: () {
                if (widget.indexNumber == 0) {
                  if (setterD == 0) {
                    widget.taskDaily.removeAt(0);
                    setterD += 1;
                  }
                  widget.taskDaily.add(task.text);
                } else if (widget.indexNumber == 1) {
                  if (setterW == 0) {
                    widget.taskWeekly.removeAt(0);
                    setterW += 1;
                  }
                  widget.taskWeekly.add(task.text);
                } else {
                  if (setterM == 0) {
                    widget.taskMonthly.removeAt(0);
                    setterM += 1;
                  }
                  widget.taskMonthly.add(task.text);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyStatelessWidget(widget.taskDaily, widget.taskWeekly, widget.taskMonthly)) 
                );
              }, 
              child: Text(
                "Create",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}