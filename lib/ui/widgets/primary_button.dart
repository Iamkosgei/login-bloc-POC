import 'package:flutter/material.dart';
import 'package:nnke/utils/colors.dart';
import 'package:nnke/utils/loaders.dart';

class PrimaryButton extends StatelessWidget {
  final String txt;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryButton(
      {Key? key,
      required this.txt,
      required this.onPressed,
      this.isLoading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: isLoading
            ? spinkitDoubleBounce
            : TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: primaryColor,
                  onSurface: Colors.grey,
                ),
                child: Text(txt.toUpperCase()),
                onPressed: onPressed,
              ),
      ),
    );
  }
}
