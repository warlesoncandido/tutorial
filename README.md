<h1>Tutorial</h1>


Created to present screens in a very cool way

**Installation**
 - Add to pubspec.yaml :
     - tutorial:^1.0.4
 - Import
 	- import 'package:tutorial/tutorial.dart';

**Screens**
 
<img src= "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2012.12.17.png?token=ALOCTXZQFGE7BYDMIG2OGQ27VRHGU">
<br><br>
<img src= "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2012.12.33.png?token=ALOCTXZR4UEGVB66QWGRHX27VRHL4">
<br><br>
<img src= "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2012.12.43.png?token=ALOCTX4EZYJFB2ZZPHKOQHS7VRHN4">
<br><br>
<img src= "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2012.12.54.png?token=ALOCTXYPHRGFGPWLPIYLMF27VRHP6">


<h2>Properties</h2>
- globalKey : Unique key of the component you want
- touchScreen: boolean that validates if the touch for the next screen will be on the entire screen
- children: List of widgets
- crossAxisAligment : Vertical alignment
- mainAxisAlignment :  Horizontal alignment
- top :top alignment
- bottom : bottom alignment
- left :  Left alignment
- right :  Right alignment

<h2>how to use</h2>

 - Create the GlobalsKeys of the components you want
 <img  src = "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2018.19.59.png?token=ALOCTXZUC7M462FGY4RUDTK7VRLQM">
 
 - Create List<TutorialItens>
 <img  src = "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2018.20.35.png?token=ALOCTX6ITT563UU2X65U6L27VRLWS">
 
 - Create List<TutorialItens>
 <img  src = "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2018.20.35.png?token=ALOCTX6ITT563UU2X65U6L27VRLWS">
 
- In the initState add the TutorialItens
 <img  src = "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2018.21.05.png?token=ALOCTX6WOPAEGG5CEXCJZ6C7VRL4G">
 
- Call the showTutorial function passing the context and the list of TurialItens as parameters
 <img  src = "https://raw.githubusercontent.com/warlesoncandido/images/master/images/Captura%20de%20Tela%202020-11-11%20%C3%A0s%2018.22.28.png?token=ALOCTXZFVEQMG3PGBLTUSFK7VRMBY">
 
 
