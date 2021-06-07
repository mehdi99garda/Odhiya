import 'package:first_flutter_app/API/config.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/pages/provider/cart_provider.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*import '../providers/cart_provider.dart';
import '../providers/loader_provider.dart';
import '../store/config.dart';
import '../widgets/utils/progress_indicator.dart';*/

class BasePage extends StatefulWidget {
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoderProvider>(
      builder: (context, _loaderModel, child) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: ProgressHUD(
            inAsyncCall: _loaderModel.isApiCallProcess,
            opacity: 0.3,
            child: pageUI(),
          ),
        );
      },
    );
  }

  _buildAppBar() {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Theme.of(context).accentColor,
      automaticallyImplyLeading: true,
      elevation: 0,
      title: Text(
        ' odhiya',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      /*actions: [
        Icon(Icons.notifications_none, color: Colors.white),
        SizedBox(width: 20),
        Icon(Icons.shopping_cart, color: Colors.white),
        Provider.of<CartProvider>(context, listen: false).cartItems.length == 0
            ? Container()
            : Stack(
                children: [
                  Icon(
                    Icons.brightness_1,
                    size: 20,
                    color: Colors.green[800],
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Center(
                      child: Text(
                        Provider.of<CartProvider>(context, listen: false)
                            .cartItems
                            .length
                            .toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
        SizedBox(width: 20),
      ],*/
    );
  }

  Widget pageUI() {
    return null;
  }
}
