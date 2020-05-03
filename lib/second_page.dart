import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() {
//  runApp(
//    MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: MyApp(),
//    ),
//  );
//}

class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  TextEditingController textcontroller = TextEditingController();

  List<String> names = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Example'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textcontroller,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'Enter names',
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                names.add(textcontroller.text);
                textcontroller.clear();
              });
            },
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.blue,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.blue.withOpacity(0.5),
                  child: Container(
//                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            names[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: RawMaterialButton(
                            child: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                names.removeAt(index);
                              });
                            },
                            shape: CircleBorder(),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: names.length,
            ),
          )
        ],
      ),
    );
  }
}
