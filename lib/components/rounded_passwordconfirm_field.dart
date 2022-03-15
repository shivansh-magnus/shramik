import 'package:flutter/material.dart';
import 'package:shramik/components/text_field_container.dart';

class RoundedPasswordConfirmField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordConfirmField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      obscureText: true,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: "Confirm Password",
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.visibility),
        border: InputBorder.none,
      ),
    ));
  }
}
