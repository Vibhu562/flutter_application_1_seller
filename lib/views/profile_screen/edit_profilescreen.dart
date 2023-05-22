import 'dart:io';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:flutter_application_1_seller/controllers/profile_controller.dart';
import 'package:flutter_application_1_seller/views/widgets/loading_indicator.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';
import 'package:flutter_application_1_seller/views/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;

  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();
  @override
  void initState() {
    super.initState();
    controller.nameController.text = widget.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: purpleColor,
          appBar: AppBar(
            title: boldText(text: editprofile, size: 18.0),
            actions: [
              controller.isloading.value
                  ? loadingIndicator(circleColor: white)
                  : TextButton(
                      onPressed: () async {
                        controller.isloading(true);

                        if (controller.profileImgPath.value.isNotEmpty) {
                          await controller.uploadProfileImage();
                        } else {
                          controller.profileImageLink =
                              controller.snapshotData['imageUrl'];
                        }

                        if (controller.snapshotData['password'] ==
                            controller.oldpassController.text) {
                          await controller.changeAuthPassword(
                              email: controller.snapshotData['email'],
                              password: controller.oldpassController.text,
                              newpassword: controller.newpassController.text);

                          await controller.updateProfile(
                            imgUrl: controller.profileImageLink,
                            name: controller.nameController.text,
                            password: controller.newpassController.text,
                          );
                          // ignore:  use_build_context_synchronously
                          VxToast.show(context, msg: "New + Updated");
                        } else if (controller
                                .oldpassController.text.isEmptyOrNull &&
                            controller.newpassController.text.isEmptyOrNull) {
                          await controller.updateProfile(
                            name: controller.nameController.text,
                            password: controller.snapshotData['password'],
                            imgUrl: controller.profileImageLink,
                          );
                          // ignore:  use_build_context_synchronously
                          VxToast.show(context, msg: "New Updated");
                        } else {
                          // ignore:  use_build_context_synchronously
                          VxToast.show(context, msg: "Some error Occured");
                          controller.isloading(false);
                        }
                      },
                      child: normalText(text: save))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              controller.snapshotData['imageUrl'] == '' &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProduct,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : controller.snapshotData['imageUrl'] != "" &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(
                          controller.snapshotData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              //Image.asset(
              // imgProduct,
              // width: 150,
              //).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                  ),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: changeImage, color: fontGrey)),
              10.heightBox,
              const Divider(
                color: white,
              ),
              customTextField(
                  label: name,
                  hint: "eg. Ecommerce Devs",
                  controller: controller.nameController),
              30.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: boldText(text: "Change your password"),
              ),
              10.heightBox,
              customTextField(
                  label: password,
                  hint: passwordHint,
                  controller: controller.oldpassController),
              10.heightBox,
              customTextField(
                  label: confirmPass,
                  hint: passwordHint,
                  controller: controller.newpassController),
            ]),
          ),
        ));
  }
}
