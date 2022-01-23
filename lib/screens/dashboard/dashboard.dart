import 'package:flutter/material.dart';

import 'database_screen/database_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 100,
          width: 200,
            child: TextButton(
              child: Text('DataBase', style: TextStyle(color: Colors.blue),),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DataBaseScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
