import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:quote_app/views/widgets/favourites_icon_button.dart';

class QuotesAndAuthors extends StatefulWidget {
  const QuotesAndAuthors({super.key});

  @override
  State<QuotesAndAuthors> createState() => _QuotesAndAuthorsState();
}

class _QuotesAndAuthorsState extends State<QuotesAndAuthors> {
  String quote = "Quote App";
  String _randomQuotes = "Loading...";
  String _currentAuthor = "";

  @override
  void initState() {
    super.initState();
    _getRandomQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 50),

          //quote
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 3, left: 3),
                    child: Text(
                      "$_randomQuotes",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.anton(),
                    ),
                  ),
                  SizedBox(height: 50),

                  //athour
                  Padding(
                    padding: const EdgeInsets.only(right: 12, left: 12),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "-$_currentAuthor",
                        textAlign: TextAlign.end,
                        style: GoogleFonts.anton(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        //elevated button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: FavouritesIconButton(
                quote: _randomQuotes,
                author: _currentAuthor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: _getRandomQuotes,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.grey[300],
                ),
                child: Text(
                  "Generate Quote",
                  style: GoogleFonts.anton(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _getRandomQuotes() async {
    print("im in the quotes function");
    final url = Uri.parse("https://zenquotes.io/api/random");
    print("Sending request to: $url");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _randomQuotes = data[0]['q'];
        _currentAuthor = data[0]['a'];
      });
    } else {
      setState(() {
        _randomQuotes = "Oops! couldn't fetch quote";
      });
    }
  }
}
