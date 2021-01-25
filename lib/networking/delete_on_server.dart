import 'dart:convert';

import 'package:cookbook/model/album_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Album> deleteAlbum(String id) async {
  final http.Response response = await http.delete(
    'https://jsonplaceholder.typicode.com/albums/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete album');
  }
}

void main() => runApp(DeleteOnServerDemo());

class DeleteOnServerDemo extends StatefulWidget {
  @override
  _DeleteOnServerDemoState createState() => _DeleteOnServerDemoState();
}

class _DeleteOnServerDemoState extends State<DeleteOnServerDemo> {
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
          title: Text('Delete Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: _futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${snapshot.data?.title ?? 'Deleted'}'),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _futureAlbum =
                                  deleteAlbum(snapshot.data.id.toString());
                            });
                          },
                          child: Text('Delete data'))
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
