import 'package:flutter/material.dart';
import '../models/note.dart';

import 'note_edit_page.dart';
import 'widgets/note_item.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final List<Note> notes = [
    Note(
      id: DateTime.now().toString(),
      title: 'title #1',
      notes: 'note #1',
    ),
    Note(
      id: DateTime.now().toString(),
      title: 'title #2',
      notes: 'note #2',
    ),
  ];

  void onInsert(Note note) {
    setState(() {
      notes.add(note);
    });
  }

  void onUpdate(Note note) {
    int index = notes.indexWhere((element) => element.id == note.id);
    setState(() {
      notes[index] = note;
    });
  }

  void onDelete(Note note) {
    int index = notes.indexWhere((element) => element.id == note.id);
    setState(() {
      notes.removeAt(index);
    });
  }

  void _showNoteNewPage(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NoteEditPage(
          entity: Note(
            id: DateTime.now().toString(),
            title: '',
            notes: '',
          ),
          onSave: (note) {
            onInsert(note);
          },
        );
      },
    );
  }

  void _showNoteEditPage(BuildContext ctx, Note entity) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NoteEditPage(
          entity: entity,
          onSave: (note) {
            onUpdate(note);
          },
        );
      },
    );
  }

  void _showDeleteDialog(BuildContext ctx, Note entity) {
    showDialog(
      context: ctx,
      builder: (ctx) => AlertDialog(
        content: Text(
          'Do you want to delete?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              onDelete(entity);
              Navigator.of(ctx).pop();
            },
            child: Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        actions: [
          IconButton(
            onPressed: () => _showNoteNewPage(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                NoteItem(
                  entity: notes[index],
                  onEdit: (ctx, entity) {
                    _showNoteEditPage(ctx, entity);
                  },
                  onDelete: (ctx, entity) {
                    _showDeleteDialog(ctx, entity);
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNoteNewPage(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
