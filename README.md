# Tutorial

<img src="https://user-images.githubusercontent.com/47983071/105987554-30276a00-607d-11eb-9f0f-69acfad9e8f8.jpeg" alt="drawing" width="200"/>

<img src="https://user-images.githubusercontent.com/47983071/105987620-4cc3a200-607d-11eb-958c-a5645bba87fb.jpeg" alt="drawing" width="200"/>


<img src="https://user-images.githubusercontent.com/47983071/105987668-5a792780-607d-11eb-9d74-6bd190c0aad2.jpeg" alt="drawing" width="200"/>


## Usage

First create the global keys and name them accordingly to where you are going to use them:
```
final keyMenu = GlobalKey();
final keyContainer = GlobalKey();
final keyChat = GlobalKey();  
```

Then create a list of TutorialItems

```
List<TutorialItems> itens = [];
@override
  void initState() {
    itens.addAll({
      TutorialItems(
          globalKey: keyMenu,
          touchScreen: true,
          top: 200,
          left: 50,
          color: Color.fromRGBO(R, G, B, opacity),
          children: [
            Text(
              "Tutorial Item 1",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: Text(
            "Next",
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          shapeFocus: ShapeFocus.oval),
      TutorialItems(
        globalKey: keyChat,
        touchScreen: true,
        top: 200,
        left: 50,
        color: Color.fromRGBO(R, G, B, opacity),
        children: [
          Text(
            "Tutorial Item 2",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: Text(
          "Next",
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
        color: Color.fromRGBO(R, G, B, opacity),
        children: [
          Text(
            "Tutorial Item 3",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          )
        ],
        widgetNext: Text(
          "Finish",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        shapeFocus: ShapeFocus.square,
      ),
    });
    super.initState();
  }
```

 #### In it we have TutorialItems, is where is the entire tutorial part of your application.

**TutorialItems**
  - **globalKey**  - The Global Key of the component you want to focus on
  - **touchScreen** - Sets whether to move to the next tutorial items by clicking anywhere on the screen
  - **children** - List of widgets to compose the screen
  - **widgetNext** - A component to move to the next item, if touchScreen is equal to false, the click will be only on that component
  - **shapeFocus** -Focus shape can be chosen using **shapeFocus.oval** or **ShapeFocus.square**
  - Can be aligned on the screen as well as positioned using **(top, bottom, left, right)**

**Tutorial.show(context,itens)**
show() -   the show () method, receives two parameters, the context and the list of TutorialItems you created
Now just run the Tutorial.show(context, itens)

```
Tutorial.showTutorial(context, itens);
```