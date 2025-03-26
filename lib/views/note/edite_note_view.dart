import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes/manager/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes/views/note/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: SafeArea(
        child: Scaffold(
          body: BlocConsumer<AddNotesCubit, AddNotesState>(
            listener: (context, state) {
              if (state is AddNotesFailure) {
                log(state.errMessage);
              }
              if (state is AddNotesSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                  inAsyncCall: state is AddNotesLoading ? true : false,
                  child: EditNoteBody());
            },
          ),
        ),
      ),
    );
  }
}
