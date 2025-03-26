import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/home/home_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('notes box');
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: false)
          .copyWith(textTheme: const TextTheme().apply(fontFamily: 'Nunito')),
    );
  }
}
