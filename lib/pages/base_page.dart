<<<<<<< HEAD
<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:woocomerce_app/API/utils/progressHUD.dart';
import 'package:woocomerce_app/widgets/widget_home_products.dart';
=======
/*import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/widgets/widget_home_products.dart';
>>>>>>> 37bef64 (product detail integration)
=======
import 'package:flutter/material.dart';
import 'package:first_flutter_app/API/utils/progressHUD.dart';
import 'package:first_flutter_app/widgets/widget_home_products.dart';
import 'package:first_flutter_app/provider/loader_provider.dart';
import 'package:provider/provider.dart';
>>>>>>> 8197442 (My secod commit)

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
  @override
  BasePageState createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  bool isApiCallProcess = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<LoderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        appBar: _buildAppBar(),
        body: ProgressHUD(
          child: pageUI(),
          inAsyncCall: loaderModel.isApiCallProcess,
          opacity: 0.3,
        ),
        // child: Text(this.widget.categoryId.toString()),
      );
    });
  } //Scaffold

  Widget pageUI() {
    return null;
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      brightness: Brightness.dark,
      elevation: 0,
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: true,
      title: Text(
        "Odhiya App",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Icon(Icons.notifications_none, color: Colors.white),
        SizedBox(width: 10),
        Icon(Icons.shopping_cart, color: Colors.white),
        SizedBox(width: 10),
      ],
    );
  }
}
<<<<<<< HEAD
<<<<<<< HEAD
=======
*/
>>>>>>> 37bef64 (product detail integration)
=======
>>>>>>> 8197442 (My secod commit)
