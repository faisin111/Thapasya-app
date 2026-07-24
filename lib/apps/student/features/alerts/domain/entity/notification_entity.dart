class NotificationEntity {
  final String title;
  final String content;
  final String type;
  final int id;
  final int senterId;
  final String createdAt;
  final String timeAgo;
  NotificationEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.senterId,
    required this.createdAt,
    required this.timeAgo
  });
}
