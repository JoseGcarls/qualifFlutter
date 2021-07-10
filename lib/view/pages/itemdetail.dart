import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif/models/comment.dart';
import 'package:flutter_qualif/utils/globals.dart';
import 'package:flutter_qualif/view/pages/item.dart';

class ItemDetailPage extends StatefulWidget{
  String image;
  String name;
  String description;
  ItemDetailPage(this.image,this.name,this.description);
  @override
  State<StatefulWidget> createState() {
    return ItemDetailState(image, name, description);
  }
  
}
class ItemDetailState extends State<ItemDetailPage>{
  String image;
  String name;
  String description;
  var controllerComment = TextEditingController();

  Widget _buildWidget(Comment c){
    return Card(
      child: ListTile(
        leading: 
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 70,
            maxWidth: 30,
            minHeight: 50,
            minWidth: 15 
            ),
          
          ),
        title: Column(
          children: [
            Text(c.user),
            Text(c.comment),
          ],
          )
      ),
    );
  }
  ItemDetailState(this.image,this.name,this.description);
  var tempComment = [];
  @override
  Widget build(BuildContext context) {
    tempComment.clear();
    for(var i = 0; i < comments.length; i++){
      if(comments[i].productName == name){
        tempComment.add(comments[i]);
      }
    }
    return DefaultTabController(
      length: 2,
       child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Detail"),
              Tab(text: "Forum"),
            ],
          ),
        ),
        body: TabBarView(children: [
          MaterialApp(
          theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Column(
              children: [
                Image(image: AssetImage('assets/$image')),
                Text(name),
                Text(description),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Comment for the game",
                  ),
                  controller: controllerComment,
                ),
                ElevatedButton(onPressed: ()=>{
                  if(controllerComment.text == ""){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Comment cannot be empty!'))
                    )
                  }else{
                    setState((){
                      comments.add(new Comment(name, controllerComment.text, user));
                      controllerComment.text = "";
                      
                    })
                  }
                }, child: Text("Submit"))
              ],
            ),
          )
        ),
          ListView(
            children: 
              tempComment.map((e) => _buildWidget(e)).toList()
          )
        ],
        ) 
      )
    );      
  }
}