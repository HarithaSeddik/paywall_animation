import 'package:flutter/material.dart';

// Custom button widget, takes button text as non-nullable input to minimize code repetition
class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.isSwitchOn,
    Key? key,
  }) : super(key: key);
  final bool isSwitchOn;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            isSwitchOn ? 'Start 7 Days Free Trial' : 'Continue',
            style:
                Theme.of(context).textTheme.button?.apply(color: Colors.black),
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
      ),
    );
  }
}
