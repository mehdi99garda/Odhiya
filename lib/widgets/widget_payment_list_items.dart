import 'package:first_flutter_app/API/models/payment_method.dart';
import 'package:first_flutter_app/widgets/widget_order_success.dart';
import 'package:flutter/material.dart';
//import 'package:santaecommerce/widgets/orders/orders_success.dart';

//import '../../models/payment_methods.dart';

class PaymentMethodLisItem extends StatelessWidget {
  final PaymentMethod paymentMethod;

  PaymentMethodLisItem({@required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () async {
        if (paymentMethod.isRouteRedirect) {
          Navigator.pushNamed(context, paymentMethod.route);
        } else {
          paymentMethod.onTap();
          //redirect to order success page
          /*  Navigator.of(context).pushNamedAndRemoveUntil(
              OrdersSuccessWidget.routeName, ModalRoute.withName('/'));*/
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).focusColor.withOpacity(0.1),
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    paymentMethod.logo,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 15),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            paymentMethod.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            paymentMethod.description,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Theme.of(context).focusColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
