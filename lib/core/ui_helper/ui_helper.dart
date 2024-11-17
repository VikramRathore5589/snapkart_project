import 'package:flutter/material.dart';

class UiHelper {
  static TextFormField customTextField(
      {required TextEditingController controller,
      required String hintText,
      BorderRadius? borderRadius,
      TextInputType? inputType}) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          )),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'This field are required';
        }
      },
    );
  }

}
