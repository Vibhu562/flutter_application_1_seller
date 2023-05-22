import 'package:flutter/material.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';

Widget orderPlaceDetails({title1, title2, d1, d2}) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              boldText(text: "$title1", color: purpleColor),
              boldText(text: "$d1", color: red),
              //    "$title1".text.make(),
              //   "$d1".text.color(redColor).fontFamily(semibold).make(),
            ],
          ),
          SizedBox(
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  boldText(text: "$title2", color: purpleColor),
                  boldText(text: "$d2", color: fontGrey),
                  // "$title2".text.fontFamily(semibold).make(),
                  // "$d2".text.make(),
                ],
              )),
        ],
      ));
}
