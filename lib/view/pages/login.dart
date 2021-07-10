import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qualif/utils/globals.dart';
import 'package:flutter_qualif/view/pages/home.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}
class LoginState extends State<LoginPage>{
  var username = TextEditingController();
  var password = TextEditingController();
  var invalidUsername = false;
  var invalidPassword = false;
  var errorUsername = "";
  var errorPassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steam Application"),
      ),
      body:
        Column(
          children: [
            Container(
              child: Image.asset("assets/logo.png"),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                errorText: invalidUsername ? errorUsername : ""
                ),
              controller: username,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                errorText: invalidPassword ? errorPassword : ""
                ),
              controller: password,
            ),
            ElevatedButton(onPressed: ()=>{
                if(username.text == ""){
                  setState((){
                    invalidUsername = true;
                    errorUsername = "Username must be filled!";
                  })
                }else if(password.text == ""){
                  setState((){
                    invalidPassword = true;
                    errorPassword = "Password must be filled!";
                  })
                }else if(password.text.length < 8){
                  setState((){
                    invalidPassword = true;
                    errorPassword = "password must be more than 8 characters!";
                  })
                }else if(
                  !password.text.contains("0")&&
                  !password.text.contains("1")&&
                  !password.text.contains("2")&&
                  !password.text.contains("3")&&
                  !password.text.contains("4")&&
                  !password.text.contains("5")&&
                  !password.text.contains("6")&&
                  !password.text.contains("7")&&
                  !password.text.contains("8")&&
                  !password.text.contains("9")
                  ){
                    setState((){
                      invalidPassword = true;
                      errorPassword = "password must contain number";
                    })
                }else{
                  setState((){
                    user = username.text;
                  }),
                  Navigator.push(context, MaterialPageRoute(builder: (builder){
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      home: Scaffold(
                        body: HomePage(),
                      )
                    );
                  }))
                }
            }, child: Text("Login"))
          ],
        )
    );
  }

}