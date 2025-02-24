import 'package:flutter/cupertino.dart';
import 'package:slaski/layout/password_layout.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  @override
  Widget build(BuildContext context) {
    return const PasswordLayout(email: '',);
  }
} 


