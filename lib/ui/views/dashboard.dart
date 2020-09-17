import 'dart:core';

import 'package:ehi_connect/ui/custom_widget/ui_utils.dart';
import 'package:ehi_connect/ui/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<Dashboard> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = [
    Item("Pasupathi Natarajan", "Male", '02/07/1994'),
    Item("Akash Ravi", "Male", '03/07/1994'),
    Item("Ajith Kumar", "Male", '04/07/1994'),
    Item("Harini Thasan", "Female", '05/07/1994'),
    Item("Bavani Pasupathi", "Female", '06/07/1994'),
    Item("kamala Mukesh", "Female", '07/07/1994'),
    Item("Pasupathi Natarajan", "Male", '02/07/1994'),
    Item("Akash Ravi", "Male", '03/07/1994'),
    Item("Ajith Kumar", "Male", '04/07/1994'),
    Item("Harini Thasan", "Female", '05/07/1994'),
    Item("Bavani Pasupathi", "Female", '06/07/1994'),
    Item("kamala Mukesh", "Female", '07/07/1994'),
    Item("Pasupathi Natarajan", "Male", '02/07/1994'),
    Item("Akash Ravi", "Male", '03/07/1994'),
    Item("Ajith Kumar", "Male", '04/07/1994'),
    Item("Harini Thasan", "Female", '05/07/1994'),
    Item("Bavani Pasupathi", "Female", '06/07/1994'),
    Item("kamala Mukesh", "Female", '07/07/1994'),
  ];

  var items = List<Item>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Item> dummySearchList = List<Item>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<Item> dummyListData = List<Item>();
      dummySearchList.forEach((item) {
        if (item.getName().toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Router.createRoute,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Search Patient",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          '${items[index].getName()}',
                          style: textFontStyle(
                            fontWeight: FontWeight.w500,
                            fontColor: Colors.black,
                          ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              '${items[index].getGender()}',
                              style: textFontStyle(
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.black38,
                              ),
                            ),
                            Text(
                              '${items[index].getDob()}',
                              style: textFontStyle(
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  String name;
  String gender;
  String dob;

  // setter

  String getName() {
    return name;
  }

  String getGender() {
    return gender;
  }

  String getDob() {
    return dob;
  }

  void setName(String name) {
    this.name = name;
  }

  void setGender(String gender) {
    this.gender = gender;
  }

  void setDob(String dob) {
    this.dob = dob;
  }

  Item(this.name, this.gender, this.dob);
}
