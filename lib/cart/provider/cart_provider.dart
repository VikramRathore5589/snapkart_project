import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:snapkart_project/cart/model/cart_model.dart';
import 'package:snapkart_project/cart/model/cart_response_model.dart';
import 'package:snapkart_project/cart/service/cart_api_service.dart';
import 'package:snapkart_project/core/app_util.dart';

class CartProvider extends ChangeNotifier {
  CartProvider(this.cartApiService);

  final CartApiService cartApiService;
  bool isLoading = false;
  String? errorMessage;
  CartResponse? cartResponse;

  Future addToCart(CartModel cartModel) async {
    try {
      isLoading = true;
      errorMessage = null;
      // notifyListeners();
      bool isSuccess = await cartApiService.addToCart(cartModel);
      notifyListeners();
      if (isSuccess) {
        Util.flutterToast(' Item Added to cart Successfully');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      Util.flutterToast(errorMessage!);
    }
  }

  Future fetchCartItems() async {
    try {
      errorMessage = null;
      isLoading = true;
      // notifyListeners();
      cartResponse = await cartApiService.fetchCartItems();
      notifyListeners();
      isLoading = false;
    } catch (e) {
      errorMessage = e.toString();
      Util.flutterToast(errorMessage!);
      isLoading = false;
    }
    notifyListeners();
  }

  Future updateCartQuantity(CartModel cartResponse) async {
    try {
      errorMessage = null;
      isLoading = true;
      bool isSuccess = await cartApiService.updateCartQuantity(cartResponse);
      notifyListeners();
      if (isSuccess) {
        Util.flutterToast('updated cart Item quantity successfully');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      Util.flutterToast(errorMessage!);
    }
  }

  Future deleteCartItem(String id) async {
    try {
      errorMessage = null;
      isLoading = true;
      bool isSuccess = await cartApiService.deleteCartItem(id);
      notifyListeners();
      if (isSuccess) {
        Util.flutterToast('Cart Item deleted successfully');
        fetchCartItems();
        notifyListeners();
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      Util.flutterToast(errorMessage!);
    }notifyListeners();
  }

  Future clearCart() async {
    try {
      errorMessage = null;
      isLoading = true;
      bool isSuccess = await cartApiService.clearCart();
      if (isSuccess) {
        Util.flutterToast('Cart clear successfully');
        fetchCartItems();
      }notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      Util.flutterToast(errorMessage!);
    }notifyListeners();
  }
}
