import 'package:cookbook/networking/delete_on_server.dart';
import 'package:cookbook/networking/send_data.dart';
import 'package:cookbook/networking/update_data.dart';
import 'package:cookbook/simplelist.dart';
import 'package:flutter/material.dart';

import 'authenticated_requests.dart';
import 'parsing_in_background.dart';
import 'simple_fetch.dart';
import 'websocket_page.dart';

class MainNetworkingMenu extends StatelessWidget {
  final _networkingMenu = [
    'Fetch data from the internet',
    'Making authenticated requests',
    'Parsing JSON in the background',
    'Working with WebSockets',
    'Delete data on the internet',
    'Send data on the internet',
    'Update data over the internet',
  ];
  final title = "Networking";

  void onTapMenu(BuildContext context, int index) {
    Widget navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = FetchDataFromNetworkDemo();
        break;
      case 1:
        navigatorWidget = AuthenticatedRequestsDemo();
        break;
      case 2:
        navigatorWidget = ParsingInBackgroundDemo();
        break;
      case 3:
        navigatorWidget = WebSocketDemo();
        break;
      case 4:
        navigatorWidget = DeleteOnServerDemo();
        break;
      case 5:
        navigatorWidget = SendDataDemo();
        break;
      case 6:
        navigatorWidget = UpdateDataDemo();
        break;
    }
    if (navigatorWidget != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => navigatorWidget));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SimpleList(list: _networkingMenu, onTapAction: onTapMenu),
    );
  }
}
