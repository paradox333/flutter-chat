import 'package:flutter/material.dart';
import 'package:flutter_avanzado_segundo_proyecto/widgets/widgets.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:const <Widget>[
            
              Logo(text: 'Register'),
            
              _Form(),
            
              Labels(route: 'login', textGesture: 'Ingresa con tu cuenta', text: '¿Ya tienes cuenta?',),
            
              Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200))

              ],
              ),
          ),
        ),
      )
   );
  }
}



class _Form extends StatefulWidget {
  const _Form({ Key? key }) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
     child: Column(
       children: [

        CustomInput(
          icon: Icons.perm_identity, 
          placeholder: 'Name',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
          ),

        CustomInput(
          icon: Icons.mail_outline, 
          placeholder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
          ),
        CustomInput(
          icon: Icons.lock_outlined, 
          placeholder: 'Password', 
          textController: passCtrl,
          isPassword: true,
          ),

        CustomButton(
          text: 'Submit', 
          onPress: (){
            print(emailCtrl.text);
            print(passCtrl.text);
          },
          ),

        
      ]), 
    );
  }
}

