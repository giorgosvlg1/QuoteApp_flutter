import 'package:flutter/material.dart';
import 'package:quote_app/data/favourites_data.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FavouritesIconButton extends StatefulWidget {
  final String quote;
  final String author;
  const FavouritesIconButton({
    super.key,
    required this.quote,
    required this.author,
  });

  @override
  State<FavouritesIconButton> createState() => FavouritesIconButtonState();
}

class FavouritesIconButtonState extends State<FavouritesIconButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [IconButton(onPressed: _updateIcon, icon: _getIcon())],
    );
  }

  void _updateIcon() {
    setState(() {
      if (isFavourite) {
        //remove
        favouritesQuotes.removeWhere(
          (item) =>
              item['quote'] == widget.quote && item['author'] == widget.author,
        );
        //snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Removed from Favourites!"),
            duration: Duration(milliseconds: 500),
          ),
        );
      } else {
        favouritesQuotes.add({'quote': widget.quote, 'author': widget.author});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Added to Favourites!"),
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  Widget _getIcon() {
    return isFavourite
        ? Icon(Icons.favorite, color: Colors.red)
        : Icon(Icons.favorite_border);
  }

  bool get isFavourite {
    return favouritesQuotes.any(
      (item) =>
          item['quote'] == widget.quote && item['author'] == widget.author,
    );
  }
}
