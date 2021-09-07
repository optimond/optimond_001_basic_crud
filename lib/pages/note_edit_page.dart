import 'package:flutter/material.dart';
import 'package:optimond_001_basic_crud/models/note.dart';

class NoteEditPage extends StatefulWidget {
  final Note entity;
  final Function(Note note) onSave;

  NoteEditPage({
    required this.entity,
    required this.onSave,
  });

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final _titleController = TextEditingController();
  final _notesController = TextEditingController();

  void onViewSave() {
    final enteredTitle = _titleController.text;
    final enteredNotes = _notesController.text;

    if (enteredTitle.isEmpty || enteredNotes.isEmpty) {
      return;
    }

    widget.onSave(Note(
      id: DateTime.now().toString(),
      title: enteredTitle,
      notes: enteredNotes,
    ));

    Navigator.of(context).pop(); // close the top most widget
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Notes',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: _notesController,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text('Save'),
              style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
              onPressed: onViewSave,
            ),
          ],
        ),
      ),
    );
  }
}
