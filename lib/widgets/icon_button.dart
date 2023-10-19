import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final VoidCallback ontap;
  final IconData icon;
  const IconBtn({
    super.key,
    required this.ontap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Material(
        elevation: 10,
        shadowColor: Colors.blueGrey,
        shape: const CircleBorder(),
        child: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.indigo,
          child: Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
