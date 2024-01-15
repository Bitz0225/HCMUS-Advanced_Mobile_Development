class BookingInputForm {
  final String? note;
  final List<String>? scheduleDetailIds;

  const BookingInputForm({this.note, this.scheduleDetailIds});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['note'] = note;
    map['scheduleDetailIds'] = scheduleDetailIds;
    return map;
  }

  factory BookingInputForm.fromJson(Map<String, dynamic> json) {
    return BookingInputForm(
      note: json['note'] as String?,
      scheduleDetailIds: json['scheduleDetailIds'] != null
          ? (json['scheduleDetailIds'] as List)
              .map((e) => e as String)
              .toList()
          : null,
    );
  }

  BookingInputForm copyWith({
    String? note,
    List<String>? scheduleDetailIds,
  }) {
    return BookingInputForm(
      note: note ?? this.note,
      scheduleDetailIds: scheduleDetailIds ?? this.scheduleDetailIds,
    );
  }
}
