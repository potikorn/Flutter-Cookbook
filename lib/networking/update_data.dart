import 'dart:convert';

import 'package:cookbook/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    'https://jsonplaceholder.typicode.com/albums/1',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'title': title}),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 UPDATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 UPDATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class UpdateDataDemo extends StatefulWidget {
  @override
  _UpdateDataDemoState createState() => _UpdateDataDemoState();
}

class _UpdateDataDemoState extends State<UpdateDataDemo> {
  final TextEditingController _controller = TextEditingController();
  Future<Album> _futureAlbum;

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Update Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data.title),
                      TextField(
                        controller: _controller,
                        decoration: InputDecoration(hintText: 'Enter title'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureAlbum = updateAlbum(_controller.text);
                            });
                          },
                          child: Text('Update Data'))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }

              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
