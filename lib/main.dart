import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Saravana Calculator'),
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

  String output = "0";

  String _output = "0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  buttonPressed(String btnText){
    if(btnText=="Clear"){
      _output="0";
      num1=0;
      num2=0;
      operand="";
    }else if(btnText=="+" || btnText=="-" || btnText=="x" || btnText=="/"){
      num1=double.parse(output);
      operand=btnText;
      _output="0";
    }else if(btnText=="."){
      if(_output.contains(".")){
        print("Already has decimal");
        return;
      }else{
        _output=_output + btnText;
      }
    }else if(btnText=="="){
      num2=double.parse(output);
      if(operand=="+")
      {
        _output=(num1+num2).toString();
      }
      if(operand=="-")
      {
        _output=(num1-num2).toString();
      }
      if(operand=="x")
      {
        _output=(num1*num2).toString();
      }
      if(operand=="/")
      {
        _output=(num1/num2).toString();
      }
      num1=0.0;
      num2=0.0;
      operand="";
    }else{
      _output=_output+btnText;
    }
    print(output);
    setState(() {
      output= double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String btnText){
     return new Expanded(
        child: new OutlineButton(
        padding: new EdgeInsets.all(30.0),
        child: new Text(btnText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => {
          buttonPressed(btnText)
        },
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(

        child :new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: new Text(output,style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold
            ))
            ),

          
          new Expanded(
            child: new Divider(),
            ),
        
          new Column(
            children:[
              new Row(
                children:[
                
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),
               

                ]),
                new Row(
                children:[
                
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("x"),
                

                ]),
                new Row(
                children:[
               
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),

                ]),
                new Row(
                children:[
               
                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+"),

                ]),
                 new Row(
                children:[
               
                buildButton("Clear"),
                buildButton("="),

                ]),
            ])
        ],)
      )
    );
  }
}
