import 'package:flutter/material.dart';
import 'package:tutorial/tutorial.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list = [
    {"url": "assets/images/sandalia.jpg", "x": 2, "y": 2},
    {"url": "assets/images/saltos.jpg", "x": 1, "y": 1},
    {"url": "assets/images/rasteirinha.jpg", "x": 1, "y": 1}
  ];

  var keyMenu = GlobalKey();
  var keyContainer = GlobalKey();
  var keyChat = GlobalKey();

  List<TutorialItems> items = [];

  @override
  void initState() {
    Future.delayed(Duration(microseconds: 200)).then((value) {
      showTutorial();
    });

    super.initState();
  }

  void showTutorial() {
    items.clear();
    items.addAll({
      TutorialItems(
          onTap: () {
            print('Click Works');
          },
          globalKey: keyMenu,
          touchScreen: true,
          top: 200,
          left: 50,
          width: 20,
          height: 20,
          children: [
            Text(
              "Ali é nosso menu , você consegue ver varias coisas nele",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Toque para continuar",
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          widgetSkip: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "PULAR",
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          shapeFocus: ShapeFocus.oval),
      TutorialItems(
        globalKey: keyChat,
        touchScreen: true,
        top: 200,
        left: 50,
        children: [
          Text(
            "Qualquer duvida que aparecer , entre no nosso chat , estamos prontos para ajudar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Toque para continuar",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        shapeFocus: ShapeFocus.oval,
      ),
      TutorialItems(
        globalKey: keyContainer,
        touchScreen: true,
        bottom: 50,
        left: 50,
        children: [
          Text(
            "Nessa sessão você vai ter acesso a todas as  Rasteirinhas",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          )
        ],
        widgetNext: Text(
          "Sair",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        shapeFocus: ShapeFocus.square,
      ),
    });

    Tutorial.showTutorial(context, items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          key: keyMenu,
        ),
        elevation: 0,
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          "DAKITA",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            key: keyChat,
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.chat_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Background(),
          /*StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: list.length,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            itemBuilder: (BuildContext context, int index) => new Container(
              key: index == 0 ? keyContainer : null,
              child: InkWell(
                onTap: () => showTutorial(),
                child: Image.asset(
                  list[index]["url"],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            staggeredTileBuilder: (int index) => new StaggeredTile.count(list[index]["x"], list[index]["y"]),
          )*/
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(44, 191, 224, 1),
          Color.fromRGBO(129, 71, 243, 1),
        ],
      )),
    );
  }
}
