import 'package:class_mgmt_systm/screens/student_screen/student_screen.dart';
import 'package:class_mgmt_systm/screens/subject_screen/subject_screen.dart';
import 'package:flutter/material.dart';

import 'screens/classroom_screen/classroom_screen.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard/database_screen/database_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      //
      // initialRoute: '/',
      // routes: {
      //   '/': (context) =>  Dashboard(),
      //   '/db': (context)=> const DataBaseScreen(),
      //   '/studentList': (context)=>  StudentScreen(),
      //   '/subjectList': (context)=> const SubjectScreen(),
      //   '/classroomList': (context)=>const ClassroomScreen()
      // },
    );
  }
}
