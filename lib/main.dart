import 'package:flutter/material.dart';
import 'package:notes/views/home/home_view.dart';

void main() {
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
