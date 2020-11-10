import 'package:flutter/material.dart';
import 'package:tutorial/tutorial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  var _keyFloat = GlobalKey();
  var _keyText = GlobalKey();
  var keyList = GlobalKey();
  List<TutorialItens> itens = [];

  @override
  void initState() {
    itens = [
      TutorialItens(
          globalKey: keyList,
          touchScreen: true,
          shapeFocus: ShapeFocus.square,
          bottom: 167,
          left: 30,
          children: [],
          widgetNext: Icon(
            Icons.arrow_right,
            color: Colors.white,
          )),
      TutorialItens(
          globalKey: _keyFloat,
          touchScreen: true,
          shapeFocus: ShapeFocus.oval,
          bottom: 167,
          left: 30,
          children: [
            Text(
              "Botão de incrementar",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.star,
              color: Colors.yellowAccent,
            )
          ],
          widgetNext: Icon(
            Icons.arrow_right,
            color: Colors.white,
          )),
      TutorialItens(
        globalKey: _keyText,
        shapeFocus: ShapeFocus.oval,
        bottom: 167,
        left: 30,
        children: [
          Positioned(
            top: 400,
            left: 100,
            child: Column(
              children: [
                Text(
                  "Texto incrementado",
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.confirmation_number,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: _keyText,
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                key: keyList,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    width: 70,
                    color: Colors.red,
                    padding: EdgeInsets.all(2),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: _keyFloat,
        onPressed: () {
          Tutorial.showTutorial(context, itens);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
