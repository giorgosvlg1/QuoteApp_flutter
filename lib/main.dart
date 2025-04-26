import 'package:flutter/material.dart';
import 'package:quote_app/data/notifiers.dart';
import 'package:quote_app/views/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          theme: ThemeData(
            brightness: isDarkMode ? Brightness.light : Brightness.dark,
          ),
          debugShowCheckedModeBanner: false,
          home: WidgetTree(),
        );
      },
    );
  }
}
