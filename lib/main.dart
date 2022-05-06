import 'package:flutter/material.dart';
import 'package:my_first_own_app/home.dart';
import 'package:my_first_own_app/nav.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'To_Do_list';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(["Nothing to do here"], ["Nothing to do here"], ["Nothing to do here"]),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {

  List<String> tasksDaily;
  List<String> tasksMonthly;
  List<String> tasksWeekly;

  MyStatelessWidget(this.tasksDaily, this.tasksWeekly, this.tasksMonthly);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.pink, 
                Colors.blue
              ],
            )
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        centerTitle: true,
        title: const Text("To-Do List"),
      ),
      body: HomePage(tasksDaily, tasksWeekly, tasksMonthly)
    );
  }
}
