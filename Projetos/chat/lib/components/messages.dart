import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import '../core/models/chat_message.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messagesStream(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Sem dados. Vamos conversar?'),
            );
          } else {
            final msgs = snapshot.data!;
            return ListView.builder(
              //   as mensagens ficam na parte debaixo           
              reverse: true,
              itemCount: msgs.length,
              itemBuilder: (ctx, i) => Text(msgs[i].text),
            );
          }
        });
  }
}
