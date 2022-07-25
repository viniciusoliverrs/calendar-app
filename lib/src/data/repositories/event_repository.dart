import 'package:schedule_events_app/src/domain/entities/event_entity.dart';
import 'package:schedule_events_app/src/domain/repositories/ievent_repository.dart';

class EventRepository implements IEventRepository {
  final List<EventEntity> _events = [];
  @override
  Stream<List<EventEntity>> getAllOnStream() {
    return Stream.value(_events);
  }

  @override
  Future<EventEntity> getById(String id) {
    return Future.value(_events.firstWhere((event) => event.id == id));
  }

  @override
  Future<bool> post(EventEntity entity) {
    _events.add(entity);
    return Future.value(true);
  }

  @override
  Future<bool> put(EventEntity entity) {
    _events.removeWhere((event) => event.id == entity.id);
    _events.add(entity);
    return Future.value(true);
  }

  @override
  Future<bool> delet(String id) {
    _events.removeWhere((event) => event.id == id);
    return Future.value(true);
  }
}
