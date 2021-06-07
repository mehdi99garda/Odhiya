import 'package:first_flutter_app/API/api_service.dart';
import 'package:first_flutter_app/API/config.dart';
import 'package:first_flutter_app/API/models/order_details.dart';
import 'package:first_flutter_app/API/utils/widget_checkpoints.dart';
import 'package:first_flutter_app/pages/base_page.dart';
import 'package:flutter/material.dart';

/*import './base_page.dart';
import '../models/order_details.dart';
import '../repository/api_service.dart';
import '../store/config.dart';
import '../widgets/checkout/checkout_checkpoints.dart';*/

class OrderDetailsScreen extends BasePage {
  //static const routeName = "order-details-screen";
  int orderId;
  OrderDetailsScreen({Key key, this.orderId}); //: super(key: key);

  @override
  _OrderDetailsWidgetState createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends BasePageState<OrderDetailsScreen> {
  APIService _apiService = APIService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget pageUI() {
    // var orderId = ModalRoute.of(context).settings.arguments as int;

    return FutureBuilder(
      future: _apiService.getOrdersDetails(this.widget.orderId),
      builder: (BuildContext context,
          AsyncSnapshot<OrderDetailsModel> orderDetailsModel) {
        if (orderDetailsModel.hasData) {
          return _orderDetailsUI(orderDetailsModel.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _orderDetailsUI(OrderDetailsModel model) {
    print(model.orderStatus);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${model.orderId.toString()}",
            style: Theme.of(context).textTheme.labelHeading,
          ),
          Text(
            model.orderDate.toString(),
            style: Theme.of(context).textTheme.labelText,
          ),
          SizedBox(height: 20),
          Text(
            "Delivered To",
            style: Theme.of(context).textTheme.labelHeading,
          ),
          Text(
            model.shipping.address1,
            style: Theme.of(context).textTheme.labelText,
          ),
          // Text(model.shipping.address2,
          //     style: Theme.of(context).textTheme.labelText),
          // Text(
          //   model.shipping.city + " " + model.shipping.state,
          //   style: Theme.of(context).textTheme.labelText,
          // ),
          SizedBox(height: 20),
          Text(
            "Payment Method",
            style: Theme.of(context).textTheme.labelHeading,
          ),
          Text(
            model.paymentMethod,
            style: Theme.of(context).textTheme.labelText,
          ),
          Divider(color: Colors.grey),
          SizedBox(height: 5),
          CheckOutCheckPoints(
            checkedTill: 0,
            checkPointFilledColor: Colors.redAccent,
            checkpoints: ["Processing", "Shipping", "Delivered"],
            orderStatus: model.orderStatus,
          ),
          Divider(color: Colors.grey),
          _listOrderItem(model),
          Divider(color: Colors.grey),
          _itemTotal("Item Total", model.itemTotalAmount.toString(),
              textStyle: Theme.of(context).textTheme.itemTotalText),
          _itemTotal("Shipping Charges", model.shippingTotal.toString(),
              textStyle: Theme.of(context).textTheme.productItemText),
          _itemTotal("Paid", model.totalAmount.toString(),
              textStyle: Theme.of(context).textTheme.itemTotalPaidText),
        ],
      ),
    );
  }

  Widget _listOrderItem(OrderDetailsModel model) {
    return ListView.builder(
        itemCount: model.lineItems.length,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return _productItems(model.lineItems[index]);
        });
  }

  Widget _productItems(OrderDetailsLineModel product) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.all(2),
      title: Text(product.productName,
          style: Theme.of(context).textTheme.productItemText),
      subtitle: Padding(
        padding: const EdgeInsets.all(1),
        child: Text("Quantity: ${product.quantity}"),
      ),
      trailing: Text(Config.currency + product.totalAmount.toString()),
      onTap: () {},
    );
  }

  Widget _itemTotal(String label, String value, {TextStyle textStyle}) {
    return ListTile(
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        contentPadding: const EdgeInsets.fromLTRB(2, -10, 2, -10),
        title: Text(label, style: textStyle),
        trailing: Text(Config.currency + " " + value));
  }
}

extension CustomStyles on TextTheme {
  TextStyle get labelHeading {
    return TextStyle(
        fontSize: 16, color: Colors.redAccent, fontWeight: FontWeight.bold);
  }

  TextStyle get labelText {
    return TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);
  }

  TextStyle get productItemText {
    return TextStyle(
        fontSize: 14, color: Colors.black, fontWeight: FontWeight.w700);
  }

  TextStyle get itemTotalText {
    return TextStyle(fontSize: 14, color: Colors.black);
  }

  TextStyle get itemTotalPaidText {
    return TextStyle(
      fontSize: 16,
      color: Colors.black,
    );
  }
}
