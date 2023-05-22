import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1_seller/const/const.dart';
import 'package:flutter_application_1_seller/services/store_services.dart';
import 'package:flutter_application_1_seller/views/orders_screen/order_details.dart';
import 'package:flutter_application_1_seller/views/widgets/loading_indicator.dart';
import 'package:flutter_application_1_seller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;
import 'package:flutter_application_1_seller/views/widgets/dashboard_button.dart';
import 'package:flutter_application_1_seller/views/widgets/appBar_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1_seller/controllers/order_controller.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
    return Scaffold(
      appBar: appbarWidget(orders),
      body: StreamBuilder(
        stream: StoreServices.getOrders(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleColor: white);
          } else {
            var data = snapshot.data!.docs;
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var time = data[index]['order_date'].toDate();
                    return SizedBox(
                      height: 100,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => OrderDetails(
                                data: data[index],
                              ));
                        },
                        tileColor: textfieldGrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          data[index]['order_code'],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: fontGrey,
                                ),
                                10.widthBox,
                                boldText(
                                    text: intl.DateFormat()
                                        .add_yMd()
                                        .format(time),
                                    color: fontGrey),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.payment,
                                  color: fontGrey,
                                ),
                                10.widthBox,
                                boldText(text: unpaid, color: red),
                              ],
                            ),
                          ],
                        ),
                        trailing: boldText(
                            text: "\$ ${data[index]['total_amount']}",
                            color: purpleColor,
                            size: 16.0),
                      ),
                    );
                  },
                ));
          }
        },
      ),
    );
  }
}
