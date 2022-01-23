import 'dart:convert';
import 'package:blurry/blurry.dart';
import 'package:class_mgmt_systm/models/subject%20model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SubjectScreen extends StatefulWidget {
  const SubjectScreen({Key? key}) : super(key: key);

  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  
  SubjectModel postFromJson (String str) {
    final jsonData = json.decode(str);
    return SubjectModel.fromJson(jsonData);
  }
  
  Future<SubjectModel> getSubject() async{
    final response = await http.get(
        Uri.parse('https://hamon-interviewapi.herokuapp.com/subjects/?api_key=3aDe0'));
    if(response.statusCode == 200) {
      return postFromJson(response.body);
    }else {
      return postFromJson(response.body);
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Subject'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: FutureBuilder<SubjectModel>(
          future: getSubject(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasError){
                return const Text('Error');
              }
              return ListView.builder(
                itemCount: snapshot.data!.subjects.length,
                  itemBuilder: (context, i) => Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${(snapshot.data!.subjects[i].id)}'),
                        backgroundColor: Colors.blueGrey,
                      ),
                      title: Text('${(snapshot.data!.subjects[i].name)}'),
                      subtitle: Text('${(snapshot.data!.subjects[i].teacher)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: (){
                          Blurry(
                              icon: Icons.verified_user,
                              themeColor: Colors.blueGrey,
                              title:
                              '${snapshot.data!.subjects[i].name}',
                              description:
                              'Subject Id: ${snapshot.data!.subjects[i].id} \n'
                                  'Subject Name: ${snapshot.data!.subjects[i].name} \n'
                                  'Subject Email:  ${snapshot.data!.subjects[i].teacher} \n'
                                  'Subject Age:  ${snapshot.data!.subjects[i].credits}',
                              confirmButtonText: 'OK',
                              onConfirmButtonPressed: () {})
                              .show(context);
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
      )
    );
  }
}
