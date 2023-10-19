import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.wine_bar_outlined),
          hintText: "Text here ...",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
