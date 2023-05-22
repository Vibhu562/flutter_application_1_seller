import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:flutter_application_1_seller/controllers/profile_controller.dart';
import 'package:flutter_application_1_seller/views/widgets/loading_indicator.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';
import 'package:flutter_application_1_seller/views/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class ShopSettings extends StatelessWidget {
  const ShopSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return Obx(() => Scaffold(
          backgroundColor: purpleColor,
          appBar: AppBar(
            title: boldText(text: shopSettings, size: 18.0),
            actions: [
              controller.isloading.value
                  ? loadingIndicator(circleColor: white)
                  : TextButton(
                      onPressed: () async {
                        controller.isloading(true);

                        await controller.updateShop(
                          shopaddress: controller.shopAddressController.text,
                          shopname: controller.shopNameController.text,
                          shopmobile: controller.shopMobileController.text,
                          shopwebsite: controller.shopWebsiteController.text,
                          shopdesc: controller.shopDescController.text,
                        );
                        //ignore: use_build_context_synchronously
                        VxToast.show(context, msg: "Shop updated");
                      },
                      child: normalText(text: save))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customTextField(
                    label: shopname,
                    hint: nameHint,
                    controller: controller.shopNameController),
                10.heightBox,
                customTextField(
                    label: address,
                    hint: shopWebsiteHint,
                    controller: controller.shopAddressController),
                10.heightBox,
                customTextField(
                    label: mobile,
                    hint: shopMobileHint,
                    controller: controller.shopMobileController),
                10.heightBox,
                customTextField(
                    label: website,
                    hint: shopWebsiteHint,
                    controller: controller.shopWebsiteController),
                10.heightBox,
                customTextField(
                    isDesc: true,
                    label: description,
                    hint: shopDescHint,
                    controller: controller.shopDescController)
              ],
            ),
          ),
        ));
  }
}
