import 'cq_brain.dart';
import 'service.dart';
import 'package:conditional_question/service.dart';
import 'package:flutter/material.dart';


void main() { 
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

var data = locator.get<CQBrain>();
//CQBrain data = CQBrain();

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                   
                    data.getQuestion(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    

                    setState(() {
                      data.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                 
                    data.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                
                child: Visibility(
                  visible: data.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                     
                      setState(() {
                        data.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                    
                      data.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}