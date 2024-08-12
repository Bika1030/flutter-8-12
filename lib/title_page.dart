import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  final String title;
  const TitlePage(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tile Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}