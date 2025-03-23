import 'package:flutter/material.dart';

class CustomNoteCard extends StatelessWidget {
  // Add const constructor with named parameters for better flexibility
  const CustomNoteCard({
    super.key,
    this.backgroundColor = const Color.fromARGB(255, 255, 0, 0),
    this.text = 'Animes produced by Ufotable',
  });

  // Define properties as final for immutability

  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: Padding(
        // Use const padding since values are fixed
        padding: const EdgeInsets.all(10), // Simplified symmetric padding
        child: Align(
          // Consider removing Align if left alignment is always needed
          alignment: Alignment.centerLeft,
          child: Text(
            maxLines: 2,
            text,
            style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Nunito',
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ),
    );
  }
}
