class ChangeOrderStatus {
  String orderId;
  String orderStatus;

  ChangeOrderStatus({required this.orderId, required this.orderStatus}

      );
  Map<String,dynamic> toJson(){
    return {
      'status':orderStatus
    };
  }
}
