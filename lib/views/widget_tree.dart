import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/data/notifiers.dart';
import 'package:quote_app/views/pages/favourites_page.dart';
import 'package:quote_app/views/pages/home_page.dart';
import 'package:quote_app/views/widgets/nav_bar_widget.dart';
import 'package:quote_app/views/widgets/quotes_and_authors.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

List<Widget> pages = [FavouritesPage(), HomePage()];

class _WidgetTreeState extends State<WidgetTree> {
  String quote = "Quote App";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quote, style: GoogleFonts.anton(color: Colors.white)),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return isDarkMode
                    ? Icon(Icons.dark_mode)
                    : Icon(Icons.light_mode);
              },
            ),
          ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return IndexedStack(
            index: selectedPage,
            children: [QuotesAndAuthors(), FavouritesPage()],
          );
        },
      ),
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
