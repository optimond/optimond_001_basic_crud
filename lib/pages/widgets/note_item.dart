import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Function(BuildContext ctx) onEdit;
  final Function(BuildContext ctx) onDelete;

  NoteItem({required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onEdit(context),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: FittedBox(
              child: Text('T'),
            ),
          ),
        ),
        title: Text('Title'),
        subtitle: Text('Note'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => onDelete(context),
        ),
      ),
    );
  }
}
