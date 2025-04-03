import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/manager/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/home/widgets/custom_app_bar.dart';
import 'package:notes/views/home/widgets/custom_note_card.dart';
import 'package:notes/views/home/widgets/empty_note.dart';
import 'package:notes/views/note/edite_note_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EditNoteView()),
          ).then((_) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          });
        },
        backgroundColor: const Color(0xff252525),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: BlocBuilder<NotesCubit, NotesState>(
                  builder: (context, state) {
                    if (state is NotesSuccess) {
                      if (state.notes.isNotEmpty) {
                        List<NoteModel> notes = state.notes;
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: notes.length,
                          itemBuilder: (context, index) {
                            return CustomNoteCard(
                              text: notes[index],
                            );
                          },
                        );
                      } else {
                        return EmptyNotes();
                      }
                    } else if (state is NotesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const Center(child: Text("No notes available"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
