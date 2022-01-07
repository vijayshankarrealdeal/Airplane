import 'dart:convert';
import 'dart:developer';

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
    try {
      final resp = await http.post(
          Uri.parse(
              'https://djangoaskaandq.azurewebsites.net/qnamaker/knowledgebases/e9da3032-37b2-4b35-a8e5-7f3c2d5c7a05/generateAnswer'),
          headers: {
            "Authorization": "EndpointKey 9b1dc753-32a0-442c-bfe8-1c3ac45568a8",
            "Content-type": "application/json"
          },
          body: json.encode({'question': sendText.text}));

      final data = json.decode(resp.body)['answers'][0]['answer'];

      message.add(ChatBubble(
        isCurrentUser: false,
        text: data,
      ));
      message.reversed;
      sendText.clear();
      load = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
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
