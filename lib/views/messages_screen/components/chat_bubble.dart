import 'package:flutter/widgets.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

Widget chatBubble() {
  //var t =
  //  data['created_on'] == null ? DateTime.now() : data['created_on'].toDate();
  // var time = intl.DateFormat("h:mma").format(t);
  return Directionality(
      //     textDirection: data['uid'] == currentUser!.uid
      //       ? TextDirection.rtl
      //     : TextDirection.ltr,
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
            //   color: data['uid'] == currentUser!.uid ? redColor : darkFontGrey,
            color: purpleColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  "${data['msg']}".text.white.size(16).make(),
            normalText(text: "Your message here"),
            10.heightBox,
            //  time.text.color(whiteColor.withOpacity(0.5)).make(),
            normalText(text: "10:45PM"),
          ],
        ),
      ));
}
