import 'dart:convert';
import 'package:blurry/blurry.dart';
import 'package:class_mgmt_systm/models/classroom%20model/class_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({Key? key}) : super(key: key);

  @override
  _ClassroomScreenState createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {

  ClassRoomModel postFromJson (String str){
    final jsonData = json.decode(str);
    return ClassRoomModel.fromJson(jsonData);
  }


  Future<ClassRoomModel> getClassRoom() async{
    final response = await http.get(
      Uri.parse('https://hamon-interviewapi.herokuapp.com/classrooms/?api_key=3aDe0'));
    if(response.statusCode == 200){
      return postFromJson(response.body);
    }else {
      return postFromJson(response.body);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Class Rooms'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: FutureBuilder<ClassRoomModel>(
          future: getClassRoom(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return const Text('Error');
              }
              return ListView.builder(
                itemCount: snapshot.data!.classrooms.length,
                  itemBuilder: (context, i) => Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Text('${(snapshot.data!.classrooms[i].id)}'),),
                      title: Text('${(snapshot.data!.classrooms[i].name)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: (){
                          Blurry(
                            icon: Icons.verified_user,
                            themeColor: Colors.blueGrey,
                            title: '${(snapshot.data!.classrooms[i].name)}',
                            description: 'ClassRoom Id:  ${(snapshot.data!.classrooms[i].id)} \n'
                                'Name:  ${(snapshot.data!.classrooms[i].name)} \n'
                                'Size:  ${(snapshot.data!.classrooms[i].size)} \n'
                                'layout:  ${(snapshot.data!.classrooms[i].layout)}',
                              confirmButtonText: 'OK',
                              onConfirmButtonPressed: () { Navigator.pop(context);}
                          ).show(context);
                        },
                      ),
                    ),
                  )
              );
            }else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
