import 'dart:convert';

import 'package:airplane/routes/support_help.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChatBotController extends ChangeNotifier {
  TextEditingController sendText = TextEditingController();
  String url = "https://djangoaskaandq.azurewebsites.net/qnamaker";
  List<ChatBubble> message = [];
  bool load = false;
  void addtext() async {
    message.add(ChatBubble(
      isCurrentUser: true,
      text: sendText.text,
    ));
    load = true;
    notifyListeners();

    ///
    ///curl -X POST https://djangoaskaandq.azurewebsites.net/qnamaker/knowledgebases/e9da3032-37b2-4b35-a8e5-7f3c2d5c7a05/generateAnswer -H "Authorization: EndpointKey 9b1dc753-32a0-442c-bfe8-1c3ac45568a8" -H "Content-type: application/json" -d "{'question':'<Your question>'}"
    ///

    final resp = await http.get(Uri.parse(url + sendText.text));
    if (resp.statusCode == 200) {
      final data = json.decode(resp.body)['data'];

      message.add(ChatBubble(
        isCurrentUser: false,
        text: data,
      ));
      message.reversed;
      sendText.clear();
      load = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    message.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    sendText.dispose();
    super.dispose();
  }
}
