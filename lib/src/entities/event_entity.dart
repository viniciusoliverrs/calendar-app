// ignore_for_file: public_member_api_docs, sort_constructors_first
class EventEntity {
  final String id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
  });
}
