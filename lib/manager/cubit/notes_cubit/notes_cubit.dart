import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  featchAllNotes() {
    emit(NotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>('notes box');

      emit(NotesSuccess(notesBox.values.toList()));
    } catch (e) {
      emit(NotesFailure('Failed to add note'));
    }
  }
}
