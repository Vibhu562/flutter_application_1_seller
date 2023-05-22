import 'package:flutter/material.dart';
import 'package:flutter_application_1_seller/const/const.dart';

Widget loadingIndicator({circleColor = purpleColor}) {
  return Center(
      child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(circleColor),
  ));
}
