import 'dart:async';
import 'dart:math';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/models/chart_user.dart';
import 'package:chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia',
      crateAt: DateTime.now(),
      userId: '123',
      userName: 'Teste',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia. Teremos reunião hoje?',
      crateAt: DateTime.now(),
      userId: 'Anderson',
      userName: 'Teste',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '3',
      text: 'BPode ser agora!',
      crateAt: DateTime.now(),
      userId: '789',
      userName: 'Buiu',
      userImageURL: 'assets/images/avatar.png',
    ),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;

  static final _msfsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msfsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChartUser user) async {
    final _newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      crateAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );

    _msgs.add(_newMessage);

    _controller?.add(_msgs);
    return _newMessage;
  }
}
