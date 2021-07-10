import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif/utils/globals.dart';
import 'package:flutter_qualif/view/pages/item.dart';
import 'package:flutter_qualif/view/pages/login.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomePage>{
    var _images = [
    "assets/csgo.jpg",
    "assets/dota2.jpg",
    "assets/outlast.png",
    "assets/deadByDaylight.jpg",
    "assets/valorant.jpg",
  ];
  void _home(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomePage(),
        ),
      );
    }));
  }
  void _detail(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: ItemPage(),
        ),
      );
    }));
  }
  void _logout(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (builder){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginPage(),
        ),
      );
    }));
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Steam Application"),
          actions: [
            PopupMenuButton(itemBuilder: (context){
              return ['Toggle Theme'].map(
                (e){ return PopupMenuItem(
                  child: TextButton(
                    child: Text('Toggle Theme'),
                    onPressed: (){
                      setState(() {
                        isDarkTheme = !isDarkTheme;
                      });
                    },
                  ),
                );
                }
              ).toList();
            })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text("Hello, $user"),
              ),
              ListTile(
                title: TextButton(
                  child: Text("Home"),
                  onPressed: () => _home(context),
                ),
              ),
              ListTile(
                title: TextButton(
                  child: Text("Detail"),
                  onPressed: () => _detail(context),
                ),
              ),
              ListTile(
                title: TextButton(
                  child: Text("Logout"),
                  onPressed: () => _logout(context),
                ),
              )
            ],
          ),
        ),
        body: Column(children: [
          CarouselSlider(
            items: [
              Image(image: AssetImage(_images[0])),
              Image(image: AssetImage(_images[1])),
              Image(image: AssetImage(_images[2])),
              Image(image: AssetImage(_images[3])),
              Image(image: AssetImage(_images[4])),
            ],
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              enlargeCenterPage: true,
            ),  
          ),
          Text("Steam is an Application that give you about detail of the game.")
        ],
       ) 
      )
    );
  }
}