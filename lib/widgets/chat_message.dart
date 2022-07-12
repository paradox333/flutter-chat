import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {

  final String text;
  final String uid;
  final AnimationController animationCtrl;

  const ChatMessage({Key? key, required this.text, required this.uid, required this.animationCtrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationCtrl,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationCtrl, curve: Curves.easeInOut),
        child: Container(
          child: uid == ''
          ? _myMessage()
          : _notMyMessage(),
        ),
      ),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:const EdgeInsets.all(8),
        margin:const EdgeInsets.only(
          bottom: 5,
          right: 5,
          left: 50
        ),
        child: Text( text, style: const TextStyle(color: Colors.white), ),
        decoration: BoxDecoration(
          color: const Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          bottom: 5,
          right: 50,
          left: 5
        ),
        child: Text( text, style: const TextStyle(color: Colors.black87), ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(212, 218, 223, 1),
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}