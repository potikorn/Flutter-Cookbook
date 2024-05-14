import 'package:cookbook/shared/widgets/simple_menu_list.dart';
import 'package:flutter/material.dart';
import 'simple_fetch.dart';
import 'authenticated_requests.dart';
import 'parsing_in_background.dart';
import 'websocket_page.dart';

class MainNetworkingMenu extends StatelessWidget {
  const MainNetworkingMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Networking")),
      body: const SimpleMenuList(
        menuList: [
          (
            'Fetch data from the internet',
            FetchDataFromNetworkDemo(),
          ),
          (
            'Making authenticated requests',
            AuthenticatedRequestsDemo(),
          ),
          (
            'Parsing JSON in the background',
            ParsingInBackgroundDemo(),
          ),
          (
            'Working with WebSockets',
            WebSocketDemo(),
          ),
        ],
      ),
    );
  }
}
