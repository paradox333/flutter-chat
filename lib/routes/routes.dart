import 'package:flutter/material.dart';
import 'package:flutter_avanzado_segundo_proyecto/pages/pages.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users'   : (_) => UsersPage(),
  'register': (_) => RegisterPage(),
  'login'   : (_) => const LoginPage(),
  'loading' : (_) => LoadingPage(),
  'chat'    : (_) => ChatPage()
}; 