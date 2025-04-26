import 'package:flutter/material.dart';



class RemoveFromFavsButton extends StatelessWidget {
  final VoidCallback onRemove;

  const RemoveFromFavsButton({super.key, required this.onRemove});
  //State<RemoveFromFavsButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            onRemove();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Deleted from favourites!"),
                duration: Duration(milliseconds: 500),
              ),
            );
            ;
          },
          icon: Icon(Icons.cancel_outlined),
        ),
      ],
    );
  }

}
