// ignore_for_file: avoid_print
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:caller/chat_page/provider/chat_provider.dart';
import 'package:caller/chat_page/provider/models_provider.dart';
import 'package:caller/chat_page/services/assets_manager.dart';
import 'package:caller/chat_page/services/services.dart';
import 'package:caller/chat_page/widgets/chat_widget.dart';
import 'package:caller/chat_page/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../constantes/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.profil});
  final String profil;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isTyping = false;

  late final TextEditingController _textEditingController;
  late final ScrollController _listScrollController;
  late final FocusNode _focusNode;
  dynamic savedThemeMode;
  bool  darkMode = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _listScrollController = ScrollController();
    _focusNode = FocusNode();
    super.initState();
    getCurrentTheme();

  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _listScrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    print(savedThemeMode.toString());
    if(savedThemeMode.toString() =='AdaptiveThemeMode.dark'){
      setState(() {
        darkMode = true;
      });
    }else{
      setState(() {
        darkMode = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final modelProvider = Provider.of<ModelsProvider>(context, listen: true);
    final chatProvider = Provider.of<ChatProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.profil),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // await Services.showModelSheet(context: context);
              print(chatProvider.getChatListLength);
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: chatProvider.getChatListLength==0?
              Container(
                child: Center(child: Text("Pas de message",style: TextStyle(fontSize: 20),),),
              ):
              ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatListLength,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatProvider.getChatList[index].msg,
                    chatIndex: chatProvider.getChatList[index].chatIndex,
                    darkMode: darkMode,
                  );
                },
              ),
            ),
            // spread operator
            if (_isTyping) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Ecrit ...  ",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SpinKitThreeBounce(
                    color: Colors.teal,
                    size: 18,
                  ),
                ],
              ),
            ],
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.grey)
              ),
              child: Material(
                color: cardColor,
                borderOnForeground: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: _focusNode,
                          controller: _textEditingController,
                          onChanged: (_) {
                            setState(() {
                              _textEditingController.text.trim();
                            });
                          },
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Demandez-moi tout !',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: _textEditingController.text.isEmpty
                            ? null
                            : () async {
                                await _sendMessageFCT(
                                  modelProvider: modelProvider,
                                  chatProvider: chatProvider,
                                );
                              },
                        icon: _isTyping
                            ? const SpinKitFadingFour(
                                color: Colors.teal,
                                size: 18,
                              )
                            : Icon(
                                Icons.send,
                                color: _textEditingController.text.isEmpty
                                    ? Colors.grey
                                    : Colors.teal,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scrollListToEnd() {
    _listScrollController.animateTo(
      _listScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }

  Future<void> _sendMessageFCT(
      {required ModelsProvider modelProvider,
      required ChatProvider chatProvider}) async {
    {
      final String msg = _textEditingController.text;
      try {
        setState(() {
          _isTyping = true;
          chatProvider.addUserMessage(msg: msg);
          _textEditingController.clear();
          _focusNode.unfocus();
        });
        await chatProvider.sendMessageAndGetResponse(
          msg: msg,
          chosenModel: modelProvider.currentModel,
        );
      } catch (error) {
        errorSnackBar(errMsg: error.toString());
        print('error--> $error');
      } finally {
        setState(() {
          scrollListToEnd();
          _isTyping = false;
        });
      }
    }
  }

  void errorSnackBar({required String errMsg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextWidget(label: errMsg),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      ),
    );
  }
}
