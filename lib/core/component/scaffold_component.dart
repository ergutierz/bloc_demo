import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget content;
  final Widget bottomBar;

  const ScaffoldWidget({
    super.key,
    required this.appBar,
    required this.content,
    required this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Expanded(child: content),
          const SizedBox(height: 16,),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: bottomBar,
        ),
      ),
    );
  }
}