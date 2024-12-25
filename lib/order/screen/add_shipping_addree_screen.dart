import 'package:flutter/material.dart';
import 'package:snapkart_project/core/ui_helper/ui_helper.dart';
import 'package:snapkart_project/profile/model/shipping_address_model.dart';

class AddShippingAddressScreen extends StatelessWidget {
  // final Function callback;

  AddShippingAddressScreen({
    super.key,
  });

  final streetController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final postalCodeController = TextEditingController();
  final countryController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add delivery Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                UiHelper.customTextField(
                    controller: streetController, hintText: 'Enter Street', validator: (value) {  }),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    controller: cityController, hintText: 'Enter city', validator: (value) {  }),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    controller: stateController, hintText: 'Enter state', validator: (value) {  }),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    inputType: TextInputType.number,
                    controller: postalCodeController,
                    hintText: 'Enter postalCode', validator: (value) {  }),
                const SizedBox(
                  height: 16,
                ),
                UiHelper.customTextField(
                    controller: countryController, hintText: 'Enter Country', validator: (value) {  }),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      placeOrderButton(context);
                    },
                    child: const Text('Continue Order'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void placeOrderButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      ShippingAddress shippingAddress = ShippingAddress(
          street: streetController.text,
          city: cityController.text,
          state: stateController.text,
          postalCode: postalCodeController.text,
          country: countryController.text);
      Navigator.pop(context, shippingAddress);
    }
  }
}
