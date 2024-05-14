import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/shared/widgets/simple_list.dart';
import 'read_and_write_file.dart';
import 'store_data_on_disk.dart';

class MainPersistenceMenu extends StatelessWidget {
  const MainPersistenceMenu({super.key});

  void onTapMenu(BuildContext context, int index) {
    Widget? navigatorWidget;
    switch (index) {
      case 0:
        navigatorWidget = ReadAndWriteFileDemo();
        break;
      case 1:
        navigatorWidget = const StoreDataOnDiskDemo();
        break;
    }
    if (navigatorWidget != null) {
      if (navigatorWidget is ReadAndWriteFileDemo && kIsWeb) {
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigatorWidget!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Networking")),
      body: SimpleList(
        list: const [
          'Reading and Writing Files${kIsWeb ? " (Not supported)" : ""}',
          'Storing key-value data on disk',
        ],
        onTapAction: onTapMenu,
      ),
    );
  }
}
