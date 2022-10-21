class ChatMessage {
  final String id;
  final String text;
  final DateTime crateAt;

  final String userId;
  final String userName;
  final String userImageURL;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.crateAt,
    required this.userId,
    required this.userName,
    required this.userImageURL,
  });
}
