import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quote_app/data/favourites_data.dart';
import 'package:quote_app/views/widgets/remove_from_favs_button.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          favouritesQuotes.isEmpty
              ? Center(child: Text("No favourites yet!"))
              : ListView.builder(
                itemCount: favouritesQuotes.length,
                itemBuilder: (context, index) {
                  final item = favouritesQuotes[index];
                  // ignore: unnecessary_null_comparison
                  if (item == null ||
                      item['quote'] == null ||
                      item['author'] == null) {
                    return SizedBox.shrink();
                  }

                  final quote = item['quote'];
                  final author = item['author'];
                  return Card(
                    elevation: 15,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Container(
                      width: double.infinity,
                      child: ListTile(
                        title: Text(quote!, style: GoogleFonts.anton()),
                        subtitle: Text("- $author"),
                        trailing: SizedBox(
                          width: 48,
                          height: 48,
                          child: RemoveFromFavsButton(
                            onRemove: () {
                              setState(() {
                                favouritesQuotes.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
