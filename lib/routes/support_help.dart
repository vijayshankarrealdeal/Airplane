import 'package:airplane/controllers/chat_bot_controller.dart';
import 'package:airplane/controllers/colormager.dart';
import 'package:airplane/controllers/typography.dart';
import 'package:airplane/widgets/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupportAndHelp extends StatelessWidget {
  const SupportAndHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: fonts.heading5("Support", color.textColor()),
        elevation: 0,
        iconTheme: IconThemeData(
          color: color.backButton(), //change your color here
        ),
        backgroundColor: color.appBarColorroute(),
      ),
      backgroundColor: color.colorofScaffoldroute(),
      body: ChangeNotifierProvider<ChatBotController>(
        create: (context) => ChatBotController(),
        child: Consumer<ChatBotController>(
          builder: (context, data, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: data.message.isEmpty
                      ? Center(
                          child: fonts.heading5(
                            "Chat With Me",
                            color.textColor(),
                          ),
                        )
                      : ListView(
                          children: data.message,
                        ),
                ),
                FormForApp(
                  suffix: data.load
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Theme(
                            data: ThemeData(
                                brightness: color.darkmode
                                    ? Brightness.dark
                                    : Brightness.light),
                            child: const CupertinoActivityIndicator(),
                          ),
                        )
                      : CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => data.addtext(),
                          child: fonts.button("Send", color.textColor()),
                        ),
                  email: data.sendText,
                  placeholder: "Ask a Question",
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.text,
    required this.isCurrentUser,
  }) : super(key: key);
  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ColorManager>(context);
    final fonts = Provider.of<TypoGraphyOfApp>(context);
    return Padding(
      // asymmetric padding
      padding: EdgeInsets.fromLTRB(
        isCurrentUser ? 64.0 : 16.0,
        4,
        isCurrentUser ? 16.0 : 64.0,
        4,
      ),
      child: Align(
        // align the child within the container
        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: DecoratedBox(
          // chat bubble decoration
          decoration: BoxDecoration(
            color: isCurrentUser ? color.backButton() : color.appBarColor(),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: fonts.body1(text, color.textColor())),
        ),
      ),
    );
  }
}
