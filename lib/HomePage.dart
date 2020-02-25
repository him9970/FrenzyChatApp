import 'package:flutter/material.dart';
import 'ChatScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: new Text("Frenzy Chat"),
      ),

      body: new ChatScreen()
    );
  }
}
