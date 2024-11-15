import 'package:flutter/foundation.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:snapkart_project/product/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  String? errorMessage;
  List<ProductModel> productList = [];
  ProductService productService;

  ProductProvider(this.productService);

  Future fetchProduct() async {
    try {
      productList = await productService.fetchProduct();
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}
