import 'package:cookbook/model/dog_model.dart';
import 'package:cookbook/persistence/helper/dog_helper.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SQLiteDemo extends StatefulWidget {
  @override
  _SQLiteDemoState createState() => _SQLiteDemoState();
}

class _SQLiteDemoState extends State<SQLiteDemo> {
  Future<List<Dog>> dogList;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDogs();
  }

  fetchDogs() {
    setState(() {
      dogList = DogHelper.instance.getDogs();
    });
  }

  clearInput() {
    nameController.clear();
    ageController.clear();
  }

  _addDummy() {
    clearInput();
    Alert(
      context: context,
      title: "Dog Info",
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            controller: nameController,
          ),
          TextField(
            maxLength: 2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            controller: ageController,
          )
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => {_addDog()},
        )
      ],
    ).show();
  }

  _addDog() {
    var dog = Dog(
        id: DateTime.now().millisecondsSinceEpoch,
        name: nameController.text,
        age: int.parse(ageController.text));
    DogHelper.instance.insertDog(dog);
    clearInput();
    Navigator.pop(context);
    fetchDogs();
  }

  _updateDog(Dog dog) {
    var alterDogInfo = Dog(
        id: dog.id,
        name: nameController.text,
        age: int.parse(ageController.text));
    DogHelper.instance.updateDog(alterDogInfo);
    Navigator.pop(context);
    fetchDogs();
  }

  _onDismiss(int id) {
    DogHelper.instance.deleteDog(id);
  }

  _onTapTile(Dog dog) {
    nameController.text = dog.name;
    ageController.text = dog.age.toString();
    Alert(
      context: context,
      title: "Edit Dog Info",
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Name'),
            controller: nameController,
          ),
          TextField(
            maxLength: 2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            controller: ageController,
          )
        ],
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Update",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _updateDog(dog),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder<List<Dog>>(
          future: dogList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.length == 0) {
                return Text('Empty list');
              }
              return ListView.builder(
                itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: ListTile(
                    title: Text('Name: ${snapshot.data[index].name}'),
                    subtitle: Text('Age: ${snapshot.data[index].age}'),
                    onTap: () => _onTapTile(snapshot.data[index]),
                  ),
                  onDismissed: (direction) =>
                      _onDismiss(snapshot.data[index].id),
                ),
                itemCount: snapshot.data.length,
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDummy,
        child: Icon(Icons.add),
      ),
    );
  }
}
