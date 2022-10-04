import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.callback,
    required this.textColor,
    required this.iconColor,
  }) : super(key: key);

  final VoidCallback callback;

  final Color buttonColor;

  final Color textColor;

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            minimumSize: const Size(double.infinity, 70)),
        onPressed: callback,
        icon: Icon(
          Icons.flash_on_outlined,
          color: iconColor,
        ),
        label: Text(
          'Find A Random Activity',
          style: TextStyle(
            fontSize: 25,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
