import 'package:chat/core/models/chart_user.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/chat/chart_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage> save(String text, ChartUser user);

  factory ChatService() {
    return ChatMockService();
  }
}
