/*import 'package:first_flutter_app/API/models/customer_detail_model.dart';
import 'package:first_flutter_app/API/utils/form_helper.dart';
//import 'package:first_flutter_app/pages/payement_method.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'checkout_base.dart';

/*import './payment_screen.dart';
import '../models/customer_details.dart';
import '../providers/cart_provider.dart';
import '../widgets/auth/auth_blueprint.dart';
import '../widgets/checkout/checkout.dart';*/

class VerifyAddressScreen extends CheckOutBasePage {
  // static const routeName = "/verify-address";

  @override
  _VerifyAddressScreenState createState() => _VerifyAddressScreenState();
}

class _VerifyAddressScreenState
    extends CheckOutBasePageState<VerifyAddressScreen> {
  bool _loader = false;
  @override
  void initState() {
    setState(() {
      _loader = true;
    });
    currentPage = 0;

    var cartProvider = Provider.of<CartProvider>(context, listen: false);
    //Future.delayed(Duration.zero).then((value) async {await
    cartProvider.fetchShippingDetails();
    setState(() {
      _loader = false;
    });
    // });

    super.initState();
  }

  @override
  Widget pageUI() {
    return _loader
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Consumer<CartProvider>(builder: (context, customerModel, child) {
            if (customerModel.customerDetailsModel.id != null) {
              return _formUI(customerModel.customerDetailsModel);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          });
  }

  Widget _formUI(CustomerDetailsModel _model) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("First Name"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Last Name"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(context, _model.shipping.),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(context, ""),
                      ),
                    ),
                  ],
                ),
                FormHelper.fieldLabel("Address"),
                FormHelper.fieldLabelValue(context, _model.shipping.address1),
                FormHelper.fieldLabel("Apartment, Suite, etc."),
                FormHelper.fieldLabelValue(context, _model.shipping.address2),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Country"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("State"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabelValue(
                          context, _model.shipping.country),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(
                            context, _model.shipping.state),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("City"),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabel("Post Code"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: FormHelper.fieldLabelValue(
                          context, _model.shipping.city),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FormHelper.fieldLabelValue(
                            context, _model.shipping.postCode),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: FormHelper.saveButton(
                    "Next",
                    () {
                      /*   Navigator.pushNamed(
                          context, PaymentMethodsScreen.routeName);*/
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


*/
