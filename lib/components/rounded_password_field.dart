import 'package:flutter/material.dart';
import 'package:shramik/components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
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
        hintText: "Password",
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.visibility),
        border: InputBorder.none,
      ),
    ));
  }
}
