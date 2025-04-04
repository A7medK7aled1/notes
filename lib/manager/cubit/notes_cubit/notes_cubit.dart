import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? note;
  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>('notes box');
    note = notesBox.values.toList();
    emit(NotesSuccess(note!));
  }
}
