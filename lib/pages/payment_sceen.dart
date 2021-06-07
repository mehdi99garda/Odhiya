// import 'package:first_flutter_app/API/models/payment_method.dart';
// import 'package:first_flutter_app/pages/checkout_base.dart';
// import 'package:first_flutter_app/widgets/widget_payment_list_items.dart';
// import 'package:flutter/material.dart';

// /*import '../models/payment_methods.dart';
// import '../widgets/checkout/checkout.dart';
// import '../widgets/payments/payment_methods_list_item.dart';*/

// class PaymentMethodsScreen extends CheckOutBasePage {
//   static const routeName = "/payment-methods-screen";
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends CheckOutBasePageState<PaymentMethodsScreen> {
//   @override
//   void initState() {
//     currentPage = 1;
//     super.initState();
//   }

//   @override
//   Widget pageUI() {
//     PaymentMethodsList list;
//     list = PaymentMethodsList(context);
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           SizedBox(
//             height: 15,
//           ),
//           list.paymentList.length > 0
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                     leading: Icon(
//                       Icons.payment,
//                       color: Theme.of(context).hintColor,
//                     ),
//                     title: Text(
//                       "Payment Options ",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.headline4,
//                     ),
//                     subtitle: Text(
//                       "Select your preferred Payment Method ",
//                     ),
//                   ),
//                 )
//               : SizedBox(height: 0),
//           SizedBox(height: 10),
//           ListView.separated(
//             itemCount: list.paymentList.length,
//             shrinkWrap: true,
//             primary: false,
//             scrollDirection: Axis.vertical,
//             separatorBuilder: (context, index) {
//               return SizedBox(height: 10);
//             },
//             itemBuilder: (context, index) {
//               return PaymentMethodLisItem(
//                 paymentMethod: list.paymentList.elementAt(index),
//               );
//             },
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           list.cashList.length > 0
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: ListTile(
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0),
//                     leading: Icon(
//                       Icons.monetization_on,
//                       color: Theme.of(context).hintColor,
//                     ),
//                     title: Text(
//                       "Cash On Delivery ",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.headline4,
//                     ),
//                     subtitle: Text(
//                       "Select your preferred Payment Method ",
//                     ),
//                   ),
//                 )
//               : SizedBox(height: 0),
//           SizedBox(height: 10),
//           ListView.separated(
//             itemCount: list.cashList.length,
//             shrinkWrap: true,
//             primary: false,
//             scrollDirection: Axis.vertical,
//             separatorBuilder: (context, index) {
//               return SizedBox(height: 10);
//             },
//             itemBuilder: (context, index) {
//               return PaymentMethodLisItem(
//                 paymentMethod: list.cashList.elementAt(index),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
