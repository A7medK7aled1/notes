import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  addNote(NoteModel noteModel) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes box');
      await notesBox.add(noteModel);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure('Failed to add note'));
    }
  }
}
