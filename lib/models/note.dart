class Note {
  final String id;
  final String title;
  final String notes;

  Note({
    required this.id,
    required this.title,
    required this.notes,
  });

  Note copyWith({
    String? id,
    String? title,
    String? notes,
  }) =>
      Note(
        id: id ?? this.id,
        title: title ?? this.title,
        notes: notes ?? this.notes,
      );
}
