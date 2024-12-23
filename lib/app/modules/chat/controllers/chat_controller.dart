import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rca_resident/app/base/base_controller.dart';
import 'package:rca_resident/app/modules/chat/model/chat_convert.dart';
import 'package:talkjs_flutter/talkjs_flutter.dart';

class ChatController extends BaseController {
  //TODO: Implement ChatController
  ChatController({required this.listChat});
  final session = Session(appId: 'tMaGxldq', );
  final isLoading = false.obs;
  Conversation? conversation;
  User? me;
  User? other;
 List<ChatModelConver> listChat;
  @override
  Future<void> onInit() async {
    await loadData();
    await Future.delayed(Duration(seconds: 2));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loadData() async {
    try {
      me = session.getUser(
        id: listChat.first.email,
        name: listChat.first.name,
        email: [
          listChat.first.email
        ],
        // photoUrl: chatData.isSender!?(chatData.sender!.image??'https://talkjs.com/images/avatar-1.jpg'):(chatData.receiver!.image??'https://talkjs.com/images/avatar-1.jpg'),
        role: 'default',
      );
       other = session.getUser(
        id: listChat.last.email,
        name: listChat.last.name,
        email: [
          listChat.last.email
        ],
        // photoUrl: chatData.isSender!?(chatData.sender!.image??'https://talkjs.com/images/avatar-1.jpg'):(chatData.receiver!.image??'https://talkjs.com/images/avatar-1.jpg'),
        role: 'default',
      );

      conversation = session.getConversation(
        id: Talk.oneOnOneId(me!.id, other!.id),
        participants: {Participant(me!), Participant(other!)},
      );
      session.me = me!;
    } catch (e) {
      log(e.toString()+'222');
    }
  }

  
}
