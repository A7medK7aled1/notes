import 'package:flutter/material.dart';
import 'package:notes/views/note/widgets/custom_text_field.dart';

class EditNoteBody extends StatelessWidget {
  const EditNoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(fontSize: 38, hintText: 'Title'),
        CustomTextField(fontSize: 20, hintText: 'Type something...'),
      ],
    );
  }
}
