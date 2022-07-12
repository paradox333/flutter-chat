import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton ({ Key? key, required this.text, required this.onPress }) : super(key: key);

  final String text;
  final void Function() onPress; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle( 
              elevation: MaterialStateProperty.all<double>(2),
              shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
               
              ),
            child:SizedBox(
              height: 55,
              child: Center(
                child: Text( 
                  text, 
                  style: const TextStyle(fontSize: 17),
                )
              )
            ),
            onPressed:onPress , 
            ),
        );
  }
}
