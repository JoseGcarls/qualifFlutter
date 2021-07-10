import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif/models/location.dart';
import 'package:flutter_qualif/utils/globals.dart';
import 'package:flutter_qualif/view/pages/home.dart';
import 'package:flutter_qualif/view/pages/itemdetail.dart';
import 'package:flutter_qualif/view/pages/login.dart';

class ItemPage extends StatelessWidget{
  var _tempcontext = null;
  var _data = [
    Location("csgo.jpg","CSGO","Counter-Strike: Global Offensive or CSGO is a multiplayer first-person shooter developed by Valve and Hidden Path Entertainment. It is the fourth game in the Counter-Strike series."),
    Location("dota2.jpg","Dota 2","Dota 2 is a multiplayer online battle arena video game in which two teams of five players compete to collectively destroy a large structure defended by the opposing team known as the Ancient, whilst defending their own."),
    Location("outlast.png","Outlast", "Outlast is a first-person survival horror video game developed and published by Red Barrels."),
    Location("deadByDaylight.jpg","Dead By Daylight", "Dead by Daylight is an asymmetrical multiplayer horror game where one player takes on the role of a brutal Killer and the other four play as Survivors. The game revolves around a freelance investigative journalist, Miles Upshur, who decides to investigate a remote psychiatric hospital named Mount Massive Asylum, located deep in the mountains of Lake County, Colorado."),
    Location("valorant.jpg","Valorant", "Valorant is a team-based first-person hero shooter set in the near future. Players play as one of a set of agents, characters designed based on several countries and cultures around the world.")
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
  
  Widget _buildWidget(Location l){
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 70,
            maxWidth: 70,
            minHeight: 50,
            minWidth: 50,
          ),
          child: Image.asset('assets/${l.image}'),
        ),
        title: Text(l.name),
        trailing: ElevatedButton(
          child: Text("See Detail"),
          onPressed: () => {
            Navigator.push(_tempcontext, MaterialPageRoute(builder: (builder){
              return ItemDetailPage(l.image, l.name, l.description);
            }))
          },
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    _tempcontext = context;
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Steam Application"),
          
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
        body: ListView(
          children: _data.map((e) => _buildWidget(e)).toList(),
        ),
      )
    );
  }
}