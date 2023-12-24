import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({
    Key? key,
    required this.hint,
    this.onChanged,
    this.textInputType
  }) : super(key: key);
  final String hint;
  final Function(String)? onChanged;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'Please Enter The Field';
        }
      },
      keyboardType: textInputType,
      style: const TextStyle(color: Color.fromARGB(255, 60, 69, 143)),
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 86, 91, 129)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
