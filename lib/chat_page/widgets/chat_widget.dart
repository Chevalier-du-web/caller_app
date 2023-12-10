import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caller/chat_page/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

import '../../constantes/constants.dart';
import '../services/assets_manager.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex, required this.darkMode});
  final String msg;
  final int chatIndex;
  final bool darkMode;


  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        InkWell(
          onLongPress: (){
            Clipboard.setData(ClipboardData(text: widget.msg));
            Fluttertoast.showToast(msg: 'Texte  copié !!!');

          },
          child: Container(
            margin: EdgeInsets.only(left: 8,right: 8,bottom: 4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Material(
              color: widget.chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 6),
                    widget.chatIndex == 0
                        ? Image.asset(
                            AssetsManager.userImage,
                            width: 30,
                            height: 30,
                          )
                        : Image.asset(
                            AssetsManager.botImage,
                            width: 30,
                            height: 30,
                          ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: widget.chatIndex == 0
                          ? TextWidget(
                              label: widget.msg,
                            )
                          : DefaultTextStyle(
                              style:  TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                  color: widget.darkMode?Colors.white:Colors.black
                              ),
                              child: AnimatedTextKit(
                                displayFullTextOnTap: true,
                                repeatForever: false,
                                isRepeatingAnimation: false,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(widget.msg.trim()),
                                ],
                              ),
                            ),
                    ),
                    widget.chatIndex == 0
                        ? const SizedBox.shrink()
                        :  Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Share.share(widget.msg);
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.teal,
                                ),
                              ),
                              SizedBox(width: 8),
                              InkWell(
                                onTap: (){
                                  Clipboard.setData(ClipboardData(text: widget.msg));
                                  Fluttertoast.showToast(msg: 'Texte  copié !!!');
                                },
                                child: Icon(
                                  Icons.copy,
                                  color: Colors.teal,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
