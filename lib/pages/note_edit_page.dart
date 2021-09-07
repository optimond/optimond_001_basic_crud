import 'package:flutter/material.dart';

class NoteEditPage extends StatefulWidget {
  final Function onSave;
  NoteEditPage({
    required this.onSave,
  });

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  void onViewSave() {
    widget.onSave();
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
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Summary',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
