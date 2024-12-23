import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rca_resident/app/resource/color_manager.dart';
import 'package:talkjs_flutter/talkjs_flutter.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        title: Text(controller.other!.name.toString()),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Column(
          children: <Widget>[
            Visibility(
              maintainState:
                  true, // It is important to set maintainState to true,
              visible: true, // Shown when the ChatBox is visible
              child: ConstrainedBox(
                constraints:
                    constraints, // We need to constrain the size of the widget,
                child: ChatBox(
                  onSendMessage: (event) async {},
                  showChatHeader: false,
                  session: controller.session,
                  conversation: controller.conversation,
                  onLoadingStateChanged: (state) {
                    if (state == LoadingState.loaded) {
                      controller.isLoading(true);
                    } else {
                      controller.isLoading(false);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
