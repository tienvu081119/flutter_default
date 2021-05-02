import 'package:design_ui/src/ui/screens/card/tab_card.dart';
import 'package:design_ui/src/ui/screens/home/tab_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news/tab_news.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<String> choices = ['1', '2', '3'];
   int indexTab = 0;
   List<Widget> bottomTab = <Widget>[TabHome(),TabCard(),TabNews()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('Are you sure you want to quit?'), actions: <Widget>[
              RaisedButton(
                  child: Text('yes'),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('cancel'),
                  onPressed: () => Navigator.of(context).pop(false)),
            ])),      
      child: Scaffold(
        backgroundColor: Color(0xfff3f2f7),
        body: IndexedStack(
          index: indexTab,
          children: bottomTab,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',
            backgroundColor: Colors.green),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Card",
                backgroundColor: Colors.green),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: "News",
                backgroundColor: Colors.green)
          ],
          currentIndex: indexTab,
          onTap: (index){
            setState(() {
              indexTab = index;
            });
          },
        )
      ),

    );
  }
}
