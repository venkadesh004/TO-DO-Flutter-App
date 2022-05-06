// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first_own_app/create.dart';

class HomePage extends StatefulWidget {
  List<String> taskDaily;
  List<String> taskWeekly;
  List<String> taskMonthly;

  HomePage(this.taskDaily, this.taskWeekly, this.taskMonthly, { Key? key }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<HomePage> createState() => _HomePage(taskDaily, taskWeekly, taskMonthly);
}

class _HomePage extends State<HomePage> {

  List<String> taskDaily;
  List<String> taskWeekly;
  List<String> taskMonthly;

  _HomePage(this.taskDaily, this.taskWeekly, this.taskMonthly);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: TaskDisplay(taskDaily: taskDaily, taskWeekly: taskWeekly, taskMonthly: taskMonthly),
      ),
    );
  }
}

class TaskDisplay extends StatelessWidget {
  const TaskDisplay({
    Key? key,
    required this.taskDaily,
    required this.taskWeekly,
    required this.taskMonthly,
  }) : super(key: key);

  final List<String> taskDaily;
  final List<String> taskWeekly;
  final List<String> taskMonthly;

  @override
  Widget build(BuildContext context) {
    List<String> taskTypes = ["Daily", "Weekly", "Monthy"];
    return Column(
      children: <Widget>[
        TaskDetails(mainTask: taskDaily, taskDaily: taskDaily, taskWeekly: taskWeekly, taskMonthly: taskMonthly, taskType: taskTypes[0], pColor: const Color.fromARGB(255, 212, 56, 240), sColor: const Color.fromARGB(255, 132, 12, 153), indexNumber: 0),
        TaskDetails(mainTask: taskWeekly, taskDaily: taskDaily, taskWeekly: taskWeekly, taskMonthly: taskMonthly, taskType: taskTypes[1], pColor: const Color.fromARGB(255, 255, 105, 59), sColor: const Color.fromARGB(255, 255, 68, 10), indexNumber: 1),
        TaskDetails(mainTask: taskMonthly, taskDaily: taskDaily, taskWeekly: taskWeekly, taskMonthly: taskMonthly, taskType: taskTypes[2], pColor: const Color.fromARGB(255, 112, 253, 117), sColor: const Color.fromARGB(255, 34, 192, 39), indexNumber: 2),
      ],
    );
  }
}

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    Key? key,
    required this.taskDaily,
    required this.taskWeekly,
    required this.taskMonthly,
    required this.taskType,
    required this.pColor,
    required this.sColor,
    required this.indexNumber,
    required this.mainTask
  }) : super(key: key);

  final List<String> taskDaily;
  final List<String> taskWeekly;
  final List<String> taskMonthly;
  final int indexNumber;
  final String taskType;
  final Color pColor;
  final Color sColor;
  final List<String> mainTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: pColor
      ),
      constraints: BoxConstraints(
        maxHeight: double.infinity
      ),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20),
      width: 400,
      child: Column(
        children: <Widget>[
          TaskHeading(taskDaily: taskDaily, taskWeekly: taskWeekly, taskMonthly: taskMonthly, sColor: sColor, pColor: pColor, taskType: taskType, indexNumber: indexNumber),
          TaskContent(task: mainTask, sColor: sColor)
        ],
      ),
    );
  }
}

class TaskContent extends StatefulWidget {
  const TaskContent({
    Key? key,
    required this.task,
    required this.sColor
  }) : super(key: key);

  final List<String> task;
  final Color sColor;

  @override
  State<TaskContent> createState() => _TaskContentState();
}

class _TaskContentState extends State<TaskContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: DailyTasksDataInsideRow(task: widget.task, scolor: widget.sColor, )
      ),
    );
  }
}

class TaskHeading extends StatelessWidget {
  const TaskHeading({
    Key? key,
    required this.taskDaily,
    required this.taskWeekly,
    required this.taskMonthly,
    required this.sColor,
    required this.pColor,
    required this.taskType,
    required this.indexNumber
  }) : super(
    key: key,
  );

  final List<String> taskDaily;
  final List<String> taskWeekly;
  final List<String> taskMonthly;
  final int indexNumber;
  final Color sColor;
  final Color pColor;
  final String taskType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: sColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              taskType+" Tasks",
                style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TaskManager(taskDaily, taskWeekly, taskMonthly, sColor, indexNumber))),
              child: Container(
                width: 35,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white
                ),
                child: Text(
                  "+",
                  style: TextStyle(
                    color: pColor,
                    fontSize: 28
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

class DailyTasksDataInsideRow extends StatefulWidget {
  const DailyTasksDataInsideRow({
    Key? key,
    required this.task,
    required this.scolor
  }) : super(key: key);

  final List task;
  final Color scolor;

  @override
  State<DailyTasksDataInsideRow> createState() => _DailyTasksDataInsideRowState();
}

class _DailyTasksDataInsideRowState extends State<DailyTasksDataInsideRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100
      ),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.task.length,
        itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: Text(
              (index+1).toString()+". "+widget.task[index],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20
              ),
            ),  
            trailing: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: widget.scolor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.edit),
                onPressed: () {},
                iconSize: 15,
              ),
            ),
          );
        }
      ),
    );
  }
}
