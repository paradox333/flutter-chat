import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key, required this.route, required this.textGesture, required this.text}) : super(key: key);

  final String route;
  final String textGesture;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(text, style: const TextStyle( color: Colors.black54, fontSize: 15),),
          const SizedBox(height: 10,),
          GestureDetector(
            child: Text(textGesture, style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),),
            onTap: () => Navigator.pushNamed(context, route),
            )
        ]),
    );
  }
}