import 'package:class_mgmt_systm/screens/classroom_screen/classroom_screen.dart';
import 'package:class_mgmt_systm/screens/student_screen/student_screen.dart';
import 'package:class_mgmt_systm/screens/subject_screen/subject_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataBaseScreen extends StatelessWidget {
  const DataBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'What you looking\nfor....?',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo.shade900),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentScreen()));
                },
                child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward_ios),
                        Text('Students List')
                      ],
                    )),
              ),
            ),


        SizedBox(
          height: 50,),


            SizedBox(
              height: 50,
              width: 200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubjectScreen()));
                },
                child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward_ios),
                        Text('Subject List')
                      ],
                    )),
              ),
            ),



            SizedBox(
              height: 50,),

            

            SizedBox(
              height: 50,
              width: 200,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClassroomScreen()));
                },
                child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward_ios),
                        Text('ClassRomm List')
                      ],
                    )),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
