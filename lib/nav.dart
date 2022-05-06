import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.pink,
                  Colors.blue
                ],
              ),
            ),
            child: Center(
              child: Text(
                "Welcome!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
