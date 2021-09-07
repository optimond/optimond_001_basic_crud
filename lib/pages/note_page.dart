import 'package:flutter/material.dart';

import 'note_edit_page.dart';
import 'widgets/note_item.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  void onInsert() {}

  void onUpdate() {}

  void onDelete() {}

  void _showNoteNewPage(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NoteEditPage(onSave: onInsert);
      },
    );
  }

  void _showNoteEditPage(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return NoteEditPage(onSave: onUpdate);
      },
    );
  }

  void _showDeleteDialog(BuildContext ctx) {
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
              onDelete();
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
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                NoteItem(
                  onEdit: (ctx) {
                    _showNoteEditPage(ctx);
                  },
                  onDelete: (ctx) {
                    _showDeleteDialog(ctx);
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
