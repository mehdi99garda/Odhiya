// import 'package:first_flutter_app/API/models/customer_detail_model.dart';
// import 'package:first_flutter_app/API/utils/form_helper.dart';
// //import 'package:first_flutter_app/pages/payement_method.dart';
// import 'package:first_flutter_app/pages/provider/cart_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'checkout_base.dart';

// /*import './payment_screen.dart';
// import '../models/customer_details.dart';
// import '../providers/cart_provider.dart';
// import '../widgets/auth/auth_blueprint.dart';
// import '../widgets/checkout/checkout.dart';*/

// class VerifyAddressScreen1 extends CheckOutBasePage {
//   // static const routeName = "/verify-address";

//   @override
//   _VerifyAddressScreenState createState() => _VerifyAddressScreenState();
// }

// class _VerifyAddressScreenState
//     extends CheckOutBasePageState<VerifyAddressScreen1> {
//   /*bool _loader = false;
//   @override
//   void initState() {
//     setState(() {
//       _loader = true;
//     });
//     currentPage = 0;

//     var cartProvider = Provider.of<CartProvider>(context, listen: false);
//     //Future.delayed(Duration.zero).then((value) async {await
//     cartProvider.fetchShippingDetails();
//     setState(() {
//       _loader = false;
//     });
//     // });

//     super.initState();
//   }

//   @override*/
//   /* Widget pageUI() {
//     _loader
//         ? Container(
//             child: Center(child: CircularProgressIndicator()),
//           )
//         : Consumer<CartProvider>(builder: (context, customerModel, child) {
//             if (customerModel.customerDetailsModel.id != null) {
//               return _formUI(customerModel.customerDetailsModel);
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           });
//   }*/

//   Widget pageUi(CustomerDetailsModel _model) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Container(
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("First Name"),
//                     ),
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("Last Name"),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: FormHelper.textInput(
//                           context,
//                           _model.shipping.firstName,
//                           (value) => {
//                             _model.shipping.firstName = value,
//                           },
//                           onValidate: (value) {
//                             if (value.toString().isEmpty) {
//                               return "please enter last Name";
//                             }
//                             return null;
//                           },
//                         ),
//                         //child: FormHelper.fieldLabelValue(context, ""),
//                       ),
//                     ),
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: FormHelper.textInput(
//                           context,
//                           _model.shipping.lastName,
//                           (value) => {
//                             _model.shipping.lastName = value,
//                           },
//                           onValidate: (value) {
//                             if (value.toString().isEmpty) {
//                               return "please enter last Name";
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 FormHelper.fieldLabel("Address"),
//                 FormHelper.textInput(
//                   context,
//                   _model.shipping.address1,
//                   (value) => {
//                     _model.shipping.address1 = value,
//                   },
//                   onValidate: (value) {
//                     if (value.toString().isEmpty) {
//                       return "please enter last Name";
//                     }
//                     return null;
//                   },
//                 ),
//                 //FormHelper.fieldLabel("Apartment, Suite, etc."),
//                 //FormHelper.fieldLabelValue(context, _model.shipping.address2),
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("Country"),
//                     ),
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("State"),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.textInput(
//                         context,
//                         _model.shipping.country,
//                         (value) => {
//                           _model.shipping.country = value,
//                         },
//                         onValidate: (value) {
//                           if (value.toString().isEmpty) {
//                             return "please enter last Name";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     /* Flexible(
//                       fit: FlexFit.tight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: FormHelper.fieldLabelValue(
//                             context, _model.shipping.state),
//                       ),
//                     ),*/
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("City"),
//                     ),
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.fieldLabel("Post Code"),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: FormHelper.textInput(
//                         context,
//                         _model.shipping.city,
//                         (value) => {
//                           _model.shipping.city = value,
//                         },
//                         onValidate: (value) {
//                           if (value.toString().isEmpty) {
//                             return "please enter last Name";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     Flexible(
//                       fit: FlexFit.tight,
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: FormHelper.textInput(
//                           context,
//                           _model.shipping.postCode,
//                           (value) => {
//                             _model.shipping.postCode = value,
//                           },
//                           onValidate: (value) {
//                             if (value.toString().isEmpty) {
//                               return "please enter last Name";
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Center(
//                   child: FormHelper.saveButton(
//                     "Next",
//                     () {
//                       /*   Navigator.pushNamed(
//                           context, PaymentMethodsScreen.routeName);*/
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
