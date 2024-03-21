import 'package:flutter/material.dart';
import 'package:portfolio/view/page/text_input_widget.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextInputWidget(),
    );
  }
}
