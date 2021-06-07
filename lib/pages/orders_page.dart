// import 'package:first_flutter_app/API/models/order.dart';
// import 'package:first_flutter_app/pages/provider/orders_provider.dart';
// import 'package:first_flutter_app/widgets/widget_order_item.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// /*import './base_page.dart';
// import '../models/order.dart';
// import '../providers/orders_provider.dart';
// import '../widgets/orders/order_item.dart';*/

// class OrdersScreen extends StatefulWidget {
//   static const routeName = "/orders-screen";
//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   bool isLoading = false;
//   @override
//   void initState() {
//     // setState(()
//     super.initState();
//     isLoading = true;
//     //});

//     // Future.delayed(Duration.zero).then((value) async {
//     var ordersProvider = Provider.of<OrdersProvider>(context, listen: false);
//     //  await
//     ordersProvider.fetchOrders();
//     // setState(() {
//     isLoading = false;
//     //  });
//     // });
//     //super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<OrdersProvider>(builder: (context, ordersModel, child) {
//       if (ordersModel.allOrders.length > 0) {
//         return _listView(context, ordersModel.allOrders);
//       } else if (ordersModel.allOrders.length == 0 && !isLoading) {
//         return Text("No Items");
//       }
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     });
//   }

//   Widget _listView(BuildContext context, List<OrdersModel> orders) {
//     return ListView(
//       children: [
//         ListView.builder(
//             itemCount: orders.length,
//             physics: ScrollPhysics(),
//             padding: const EdgeInsets.all(8),
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               OrdersModel _indexItem = orders[index];
//               return Card(
//                 elevation: 0,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: OrderItem(_indexItem),
//               );
//             })
//       ],
//     );
//   }

//   // @override
//   /* Widget build(BuildContext context) {
//     // TODO: implement build
//     // throw UnimplementedError();
//   }*/
// }
