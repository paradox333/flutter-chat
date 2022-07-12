import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_segundo_proyecto/widgets/chat_message.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{

  final _textCtrl = TextEditingController();
  final _focusNode = FocusNode();
  bool _writing = false;
  List<ChatMessage> _messages = [
    // ChatMessage(text: 'text', uid: ''),
    // ChatMessage(text: 'text', uid: '22'),
    // ChatMessage(text: 'text', uid: ''),
    // ChatMessage(text: 'text', uid: '22'),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       title: Column(
         children: [
           CircleAvatar(
             maxRadius: 17,
             child: const Text('Te', style: TextStyle(fontSize: 12),),
             backgroundColor: Colors.blue[100],
           ),
           SizedBox(height: 3,),
           Text('Texto prueba', style: TextStyle(color: Colors.black87, fontSize: 12),)
         ],
       ),
       centerTitle: true,
       elevation: 1
     ),

     body: Container(
       child: Column(
         children: [
           Flexible(child: ListView.builder(
             physics: BouncingScrollPhysics(),
             itemCount: _messages.length,
             itemBuilder: (_, i) =>_messages[i],
             reverse: true,
             )),

          Divider( height: 1),

          Container(
            color: Colors.white,
            child: _inuputChat(),
          )
         ],
       ),
     ),
   );
  }

  Widget _inuputChat(){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textCtrl,
                onSubmitted: _handleSubmit,
                onChanged: (text){
                  setState(() {
                    if(text.isNotEmpty){
                      _writing = true;
                    } else {
                      _writing = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(hintText: 'Enviar mensaje'),
                focusNode: _focusNode, 
              )
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS 
              ? CupertinoButton(
                child: const Text('Enviar'), 
                onPressed:  _writing 
                    ? () => _handleSubmit(_textCtrl.text.trim())
                    : null,
                )
              : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData( color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.send),
                    onPressed: _writing 
                    ? () => _handleSubmit(_textCtrl.text.trim())
                    : null,
                  ),
                ),
              )
            )
          ],
        ),
      ) 
    );
  }

  _handleSubmit( String text ){

    if( text.isEmpty) return;
    _textCtrl.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text, 
      uid: '',
      animationCtrl: AnimationController( vsync: this, duration: const Duration( milliseconds: 500)),
      );
    _messages.insert(0, newMessage);
    newMessage.animationCtrl.forward();

    setState(() {
      _writing = false;
    });


    @override
    void dispose(){
      for( ChatMessage message in _messages){
        message.animationCtrl.dispose();
      }

      super.dispose(); 
    }
  }
}