import 'dart:convert';

import 'package:blurry/blurry.dart';
import 'package:class_mgmt_systm/models/student%20model/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StudentScreen extends StatefulWidget {
  const StudentScreen({
    Key? key,
  }) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  StudentsModel postFromJson(String str) {
    final jsonData = json.decode(str);
    return StudentsModel.fromJson(jsonData);
  }

  Future<StudentsModel> getStudent() async {
    final response = await http.get(Uri.parse(
        'https://hamon-interviewapi.herokuapp.com/students/?api_key=3aDe0'));
    if (response.statusCode == 200) {
      return postFromJson(response.body);
    } else {
      throw Exception('unable to fetch details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Students'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: FutureBuilder<StudentsModel>(
            future: getStudent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text("Error");
                }

                return ListView.builder(
                    itemCount: snapshot.data!.students.length,
                    itemBuilder: (context, i) => Card(
                          elevation: 6,
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text('${snapshot.data!.students[i].id}'),
                              backgroundColor: Colors.blueGrey,
                            ),
                            title: Text(' ${snapshot.data!.students[i].name}'),
                            subtitle:
                                Text(' ${snapshot.data!.students[i].email}'),
                            trailing: IconButton(
                              onPressed: () {
                                Blurry(
                                        icon: Icons.verified_user,
                                        themeColor: Colors.blueGrey,
                                        title:
                                            '${snapshot.data!.students[i].name}',
                                        description:
                                            'Student Id: ${snapshot.data!.students[i].id} \n'
                                            'Student Name: ${snapshot.data!.students[i].name} \n'
                                            'Student Email:  ${snapshot.data!.students[i].email} \n'
                                            'Student Age:  ${snapshot.data!.students[i].age}',
                                        confirmButtonText: 'OK',
                                        onConfirmButtonPressed: () {})
                                    .show(context);
                              },
                              icon: const Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
