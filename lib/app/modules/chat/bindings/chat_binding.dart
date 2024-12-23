import 'package:get/get.dart';
import 'package:rca_resident/app/modules/chat/model/chat_convert.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    List<ChatModelConver> listChat = Get.arguments as  List<ChatModelConver> ;
    Get.lazyPut<ChatController>(
      () => ChatController(listChat: listChat),
    );
  }
}
