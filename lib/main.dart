import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: LoginScreen(),
        ),
      ),
    ),
  );
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Login Screen'),
    );
  }
}
