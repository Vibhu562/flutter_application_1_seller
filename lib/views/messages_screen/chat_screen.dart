import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1_seller/views/messages_screen/components/chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: darkGrey,
              ),
              onPressed: () {
                Get.back();
              }),
          title: boldText(text: chat, size: 16.0, color: fontGrey),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
                child: Container(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return chatBubble();
                  })),
            )),
            10.heightBox,
            SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Enter Message",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: purpleColor))),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: purpleColor,
                        ))
                  ],
                ))
          ]),
        ));
  }
}
