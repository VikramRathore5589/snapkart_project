class ApiUrl{
  static const baseUrl='https://e-commerce-server-zc33.onrender.com/api';
  static const signUpUrl='$baseUrl/users/register';
  static const loginUrl='$baseUrl/users/login';
  static const fetchProductUrl='$baseUrl/products';
  static const getCategoryUrl='$baseUrl/categories';
  static const deleteProductUrl='$baseUrl/products/';
  static const addToCartUrl='$baseUrl/cart';
  static const fetchCartItemsUrl='$baseUrl/cart';
  static const updateCartUrl='$baseUrl/cart';
  static const deleteCartItemUrl='$baseUrl/cart/';
  static const placeOrderUrl='$baseUrl/orders';
  static const clearCartUrl='$baseUrl/cart';
  static const fetchOrders='$baseUrl/orders';
  static  updateOrderStatusUrl(String orderNumber){
    return '$baseUrl/orders/$orderNumber';
  }

}