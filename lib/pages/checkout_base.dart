import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/API/utils/widget_checkpoints.dart';
import 'package:first_flutter_app/pages/provider/loader_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*import '../../providers/loader_provider.dart';
import '../checkout/checkout_checkpoints.dart';
import '../utils/progress_indicator.dart';*/
export '';

class CheckOutBasePage extends StatefulWidget {
  @override
  CheckOutBasePageState createState() => CheckOutBasePageState();
}

class CheckOutBasePageState<T extends CheckOutBasePage> extends State<T> {
  int currentPage = 0;
  bool showBackButton = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: ProgressHUD(
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CheckOutCheckPoints(
                  checkedTill: currentPage,
                  checkPointFilledColor: Colors.green,
                  checkpoints: ["Shipping", "Payment", "Order"],
                ),
                Divider(color: Colors.grey),
                pageUI(),
              ],
            ),
          ),
        ),
      );
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.light,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: showBackButton,
      title: Text(
        "Checkout",
        style: TextStyle(color: Colors.white),
      ),
      actions: [],
    );
  }

  Widget pageUI() {
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
