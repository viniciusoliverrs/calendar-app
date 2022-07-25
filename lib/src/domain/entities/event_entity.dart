// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventEntity {
  final String id;
  final String title;
  final String description;
  final List<DateTime> rangesDates;
  EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.rangesDates,
  });

  EventEntity copyWith({
    String? id,
    String? title,
    String? description,
    List<DateTime>? rangesDates,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      rangesDates: rangesDates ?? this.rangesDates,
    );
  }
}
