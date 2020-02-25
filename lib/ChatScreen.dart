import 'package:flutter/material.dart';
import 'package:frenzychat/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textcontroller = new TextEditingController();
  final List<ChatMessage>_message = <ChatMessage> [];
  void _handleSubmitted(String text){

    _textcontroller.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget(){

    return new IconTheme(
      data: new IconThemeData(
        color: Colors.blue,
      ),
      child: new Container(

        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textcontroller,
                onSubmitted: _handleSubmitted,
              ),
            ),

            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: new IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textcontroller.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _message[index],
            itemCount: _message.length,
          ),
        ),

        new Divider(height: 1,),

        new Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,

          ),

          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
