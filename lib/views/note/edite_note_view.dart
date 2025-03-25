import 'package:flutter/material.dart';
import 'package:notes/views/note/widgets/custom_app_bar.dart';
import 'package:notes/views/note/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: EditNoteBody(),
      ),
    );
  }
}
