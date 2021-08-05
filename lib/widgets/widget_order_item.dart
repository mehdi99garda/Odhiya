import 'package:first_flutter_app/API/models/order.dart';
import 'package:first_flutter_app/pages/base_page.dart';
import 'package:first_flutter_app/pages/orders_details_page.dart';
import 'package:flutter/material.dart';

//import '../../models/order.dart';
//import '../../screens/order_details_screen.dart';

class OrderItem extends StatelessWidget {
  OrdersModel ordersModel;

  OrderItem(this.ordersModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _orderStatus(ordersModel.status.toString()),
          Divider(color: Colors.grey),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(Icons.edit, color: Colors.redAccent),
                Text("Order ID",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Text(ordersModel.orderId.toString(),
                  style: TextStyle(fontSize: 14))
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconText(
                Icon(Icons.today, color: Colors.redAccent),
                Text("Order Date",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Text(ordersModel.orderDate.toString(),
                  style: TextStyle(fontSize: 14))
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              flatButton(
                Row(
                  children: [
                    Text("  Order Details  "),
                    Icon(Icons.chevron_right),
                  ],
                ),
                Colors.green,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailsScreen(
                              orderId: this.ordersModel.orderId)));

                  //   Navigator.pushNamed(context, OrderDetailsScreen.routeName,
                  //    arguments: ordersModel.orderId);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget iconText(Icon iconWidget, Text textWidget) {
    return Row(
      children: [iconWidget, SizedBox(width: 5), textWidget],
    );
  }

  Widget flatButton(Widget iconWidget, Color color, Function onPressed) {
    return TextButton(
      child: iconWidget,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(5),
        backgroundColor: color,
        primary: Colors.black,
        shape: StadiumBorder(),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }

  Widget _orderStatus(String status) {
    Icon icon;
    Color color;

    if (status == "pending" || status == "processing" || status == "on-hold") {
      icon = Icon(Icons.timer, color: Colors.orange);
      color = Colors.orange;
    } else if (status == "completed") {
      icon = Icon(Icons.check, color: Colors.green);
      color = Colors.green;
    } else {
      icon = Icon(Icons.clear, color: Colors.redAccent);
      color = Colors.redAccent;
    }
    return iconText(
      icon,
      Text(
        "Order $status",
        style: TextStyle(
          fontSize: 15,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
