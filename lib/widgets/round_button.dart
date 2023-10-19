import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final double width;
  final VoidCallback ontap;
  const RoundButton({
    super.key,
    required this.title,
    required this.ontap, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        width: width,
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
