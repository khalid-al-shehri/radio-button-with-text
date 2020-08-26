import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'select title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'select title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List Items = [
    {
      'id':1,
      'name':'Khalid',
      'age': 25,
      'isSelected':false,
    },
    {
      'id':2,
      'name':'Ali',
      'age': 22,
      'isSelected':false,
    },
    {
      'id':3,
      'name':'Mohammed',
      'age': 33,
      'isSelected':false,
    },
    {
      'id':4,
      'name':'Hassan',
      'age': 12,
      'isSelected':false,
    },
    {
      'id':5,
      'name':'Azam',
      'age': 43,
      'isSelected':false,
    },
    {
      'id':6,
      'name':'Saad',
      'age': 23,
      'isSelected':false,
    }
  ];

  selected(int id){
    List.generate(Items.length, (index){
      if(id == Items[index]['id']){
        setState(() {
          Items[index]['isSelected'] = true;
        });
      }
      else{
        Items[index]['isSelected'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.02),
          ),
          child: Container(
            height: 50,
            child: Center(
              child: ListView.builder(
                  itemCount: Items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(

                      child: FlatButton(
                          child: Container(
                            child: Text(
                              Items[index]['name'],
                              style: TextStyle(
                                  color: Items[index]['isSelected'] == true ? Colors.black : Colors.black45
                              ),
                            ),
                          ),
                          onPressed: () {
                            selected(Items[index]['id']);
                          }
                      ),
                    );
                  }
              ),
            ),
          )
      )
    );
  }
}
