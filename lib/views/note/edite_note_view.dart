import 'package:flutter/material.dart';
import 'package:notes/manager/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/views/note/widgets/edit_note_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AddNotesCubit(),
          child: EditNoteBody(),
        ),
      ),
    );
  }
}
