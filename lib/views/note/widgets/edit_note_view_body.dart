import 'package:flutter/material.dart';
import 'package:notes/views/note/widgets/custom_app_bar.dart';
import 'package:notes/views/note/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key});

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? _title, _subTitle;
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  void _validateAndSaveForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      // Proceed with saving or further actions
    } else {
      setState(() => _autovalidateMode = AutovalidateMode.always);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            CustomAppBar(onPressed: _validateAndSaveForm),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      fontSize: 38,
                      hintText: 'Title',
                      onSaved: (value) => _title = value,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      fontSize: 20,
                      hintText: 'Type something...',
                      onSaved: (value) => _subTitle = value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
