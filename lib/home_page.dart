import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_api/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePost> samplePost = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: samplePost.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User id: ${samplePost[index].userId}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Id: ${samplePost[index].id}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Title: ${samplePost[index].title}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Body: ${samplePost[index].body}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  // Future<List<SamplePost>> getData() async {
  //   final response =
  //       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in data) {
  //       samplePost.add(SamplePost.fromJson(index));
  //     }
  //     return samplePost;
  //   } else {
  //     return samplePost;
  //   }
  // }


  Future<List<SamplePost>> getData()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map<String dynamic> index in data){
        samplePost.add(SamplePost.fromJson(index));
      }
      return samplePost;
    }else{
      return samplePost;
    }
  }
}
