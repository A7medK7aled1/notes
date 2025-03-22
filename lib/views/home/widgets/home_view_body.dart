import 'package:flutter/material.dart';
import 'package:notes/views/home/widgets/custom_app_bar.dart';

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
      body: const SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            SizedBox(height: 80),
            EmptyNotes(),
          ],
        ),
      ),
    );
  }
}
