// import 'package:first_flutter_app/API/utils/form_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/single_child_widget.dart';


// class ProductAdd extends StatefulWidget {
//   final PageType pagetype;
//   final ProductModel model;

//   ProductAdd({this.pagetype, this.model});
//   @override
//   _ProductAddState createState() => _ProductAddState();
// }

// class _ProductAddState extends State<ProductAdd> {
//   ProductModel productModel;
//   GlobalKey<FormState> globalKey =GlobalKey<FormState>;
//   @override

//   void @override
//   void initState() { 
//     super.initState();
//     this.pageTitle = this.widget.pageType == PageType.Add ? "Add Product" : "Edit Product";
    
//   }
//   Widget pageUI() {
//     return new Form(
//       key: globalKey,
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child:Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(padding: EdgeInsets.only(bottom:10),child: FormHelper.inputFiledWidgetWithLabel(),)
//             ],
//           ) ,
//         ),
        
//       ),
//     );
//   }
// }
