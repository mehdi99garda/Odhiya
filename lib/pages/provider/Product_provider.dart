import 'package:first_flutter_app/API/models/product.dart';
import 'package:first_flutter_app/API/models/product_model.dart';
import 'package:first_flutter_app/pages/api.dart';
import 'package:flutter/foundation.dart';
import 'package:first_flutter_app/API/api_service.dart';

class Productprovider with ChangeNotifier {
  APIService _apiService = new APIService();

  // start upload image
  createProduct(Product model, Function onCallback) async {
    List<Images> productImages = new List<Images>.empty(growable: true);
    if (model.images.length > 0) {
      await Future.forEach(model.images, (Images images) async {
        String imageUrl = await _apiService.uploadImage(images.src);

        if (imageUrl != null) {
          print("imageURL is " + imageUrl);
          productImages.add(new Images(src: imageUrl));
        }
      });
    }

    if (productImages.length > 0) {
      model.images = productImages;
    }

    Product _productModel = await _apiService.createProduct(model);

    if (_productModel != null) {
      onCallback(true);
    } else {
      onCallback(false);
    }

    notifyListeners();
  }
}
