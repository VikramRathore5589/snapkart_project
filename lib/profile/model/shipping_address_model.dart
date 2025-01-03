class ShippingAddress {
  String street;
  String city;
  String state;
  String postalCode;
  String country;

  ShippingAddress({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  // Factory method to create an object from JSON
  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
    );
  }

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    };
  }
}
