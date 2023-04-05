import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomAuthTextField extends StatelessWidget {

  final String hint;
  final TextEditingController textFieldController;
  final TextInputType keyboardType;
  final bool password;
  final IconData icon;

  const CustomAuthTextField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    required this.password,
    required this.icon,
    required this.textFieldController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: textFieldController ,
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
                icon,
            ),
            contentPadding: EdgeInsetsDirectional.only(top: 12.0)
        ),
        keyboardType: keyboardType,
        obscureText: password,
      ),
    );
  }
}
