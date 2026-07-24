import 'package:flutter/foundation.dart';
import 'package:thapasya/apps/student/features/alerts/domain/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    required super.title,
    required super.content,
    required super.type,
    required super.senterId,
    required super.createdAt,
    required super.timeAgo,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      type: json["target_type"],
      senterId: json["sender_id"],
      createdAt: json["created_at"],
      timeAgo: json["created_at"],
    );
  }

  NotificationModel copyWithin({String? time}) {
    return NotificationModel(
      id: id,
      title: title,
      content: content,
      type: type,
      senterId: senterId,
      createdAt: createdAt,
      timeAgo: time ?? this.timeAgo,
    );
  }
}
