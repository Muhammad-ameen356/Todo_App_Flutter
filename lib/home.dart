import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> lst = [];
  var output = "";
  // final _text = TextEditingController();
  final nameHolder = TextEditingController();
  initialValue(val) {
    return TextEditingController(text: val);
  }

  clearTextInput() {
    nameHolder.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: Color(0xff007a7a),
          centerTitle: true,
          foregroundColor: Colors.black,
          title: Text(
            "TODO APP",
            style: TextStyle(
              color: Color(0xff8affff),
              fontWeight: FontWeight.bold,
              fontSize: 30,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                  color: Colors.white,
                ),
                Shadow(
                  offset: Offset(0.0, 0.0),
                  blurRadius: 2.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: Colors.teal[50],
          child: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        // bottomRight: Radius.circular(50),
                        // topLeft: Radius.circular(20),
                        // bottomLeft: Radius.circular(10),
                      ),
                      color: Colors.teal[400],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Double Tap to See Your Edit And Delete Button'),
                          duration: Duration(seconds: 5),
                        ));
                      },
                      child: Container(
                        child: GestureDetector(
                          onDoubleTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Or Delete"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return SingleChildScrollView(
                                                    child: AlertDialog(
                                                      title: Text("Edit Todo"),
                                                      content: TextFormField(
                                                        controller:
                                                            initialValue(
                                                                lst[index]),
                                                        onChanged: (value) {
                                                          output = value;
                                                        },
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              // txt.text = "My name";
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              setState(() {
                                                                lst.replaceRange(
                                                                    index,
                                                                    index + 1,
                                                                    {output});
                                                              });
                                                            },
                                                            child: Text(
                                                                "Edit Item")),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child:
                                                                Text("Cancel")),
                                                        // ElevatedButton(
                                                        //     onPressed: () {
                                                        //       // txt.text = "My name";
                                                        //       initialValue(lst).selection;
                                                        //     },
                                                        //     child: Text("Clear"))
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text("Edit")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      "Are You Sure, You want to delete your task",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            setState(() {
                                                              lst.removeAt(
                                                                  index);
                                                            });
                                                          },
                                                          child: Text("Yes")),
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Text("No")),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: Text("Delete")),
                                    ],
                                  );
                                });
                          },
                          child: ListTile(
                            title: Text(
                              "${lst[index]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
        floatingActionButton: Container(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Add Todo"),
                      content: TextField(
                        controller: nameHolder,
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (nameHolder.text == "") {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // Retrieve the text the user has entered by using the
                                        // TextEditingController.
                                        content: Text("Please Input Text"),
                                      );
                                    },
                                  );
                                } else {
                                  Navigator.of(context).pop();
                                  lst.add(output);
                                }
                              });
                            },
                            child: Text("Add Item"))
                      ],
                    );
                  });
            },
            child: Icon(Icons.add, size: 40),
            backgroundColor: Colors.teal[800],
          ),
        ));
  }
}
