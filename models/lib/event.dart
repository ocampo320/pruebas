import 'payload_event.dart';

class Event<T> {
  String id;
  String commandId;
  String name;
  String status;
  PayloadEvent<T> payload;
  String scope;

  Event.empty();

  Event(
    this.id,
    this.commandId,
    this.name,
    this.status,
    this.payload,
    this.scope,
  );

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        json['id'] as String,
        json['commandId'] as String,
        json['name'] as String,
        json['status'] as String,
        json['payload'] == null
            ? null
            : PayloadEvent.fromJson(json['payload'] as Map<String, dynamic>),
        json['scope'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'commandId': commandId,
        'name': name,
        'status': status,
        'payload': payload.toJson(),
        'scope': scope,
      };
}
