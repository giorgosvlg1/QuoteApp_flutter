import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quote_app/views/widget_tree.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: WidgetTree());
  }
}
