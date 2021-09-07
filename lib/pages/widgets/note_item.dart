import 'package:flutter/material.dart';
import 'package:optimond_001_basic_crud/models/note.dart';

class NoteItem extends StatelessWidget {
  final Note entity;
  final Function(BuildContext ctx, Note entity) onEdit;
  final Function(BuildContext ctx, Note entity) onDelete;

  NoteItem({
    required this.entity,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    String firstLetter = entity.title.substring(0, 1).toUpperCase();
    return GestureDetector(
      onTap: () => onEdit(context, entity),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: FittedBox(
              child: Text(firstLetter),
            ),
          ),
        ),
        title: Text(entity.title),
        subtitle: Text(entity.notes),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => onDelete(context, entity),
        ),
      ),
    );
  }
}
