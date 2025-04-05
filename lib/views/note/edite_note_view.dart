import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/manager/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/note/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, this.noteModel});

  final NoteModel? noteModel;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddNotesCubit>(
          create: (context) => AddNotesCubit(),
        ),
      ],
      child: SafeArea(
        child: BlocConsumer<AddNotesCubit, AddNotesState>(
          listener: (context, state) {
            if (state is AddNotesSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Note added successfully.')),
              );
            } else if (state is AddNotesFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to add note.')),
              );
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: ModalProgressHUD(
                  inAsyncCall: state is AddNotesLoading ? true : false,
                  child: EditNoteBody()),
            );
          },
        ),
      ),
    );
  }
}
