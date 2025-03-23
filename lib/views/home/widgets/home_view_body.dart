import 'package:flutter/material.dart';
import 'package:notes/views/home/widgets/custom_app_bar.dart';
import 'package:notes/views/home/widgets/custom_note_card.dart';
import 'empty_note.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xff252525),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          child: Column(
            children: [
              const CustomAppBar(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomNoteCard(),
                      ],
                    );
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
