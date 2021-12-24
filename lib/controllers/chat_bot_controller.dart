import 'dart:convert';

import 'package:airplane/routes/support_help.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ChatBotController extends ChangeNotifier {
  TextEditingController sendText = TextEditingController();
  String url = "https://airlinefly.azurewebsites.net/api/askquestion/";
  List<ChatBubble> message = [];
  bool load = false;
  void addtext() async {
    message.add(ChatBubble(
      isCurrentUser: true,
      text: sendText.text,
    ));
    load = true;
    notifyListeners();

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
