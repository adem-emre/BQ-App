import 'package:flutter/material.dart';

import '../../../core/constant/app_strings.dart';

class PasswordTextForm extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String hintText = AppStrings.passwordStr;
  final String? Function(String?)? validator;

  const PasswordTextForm({Key? key, this.padding, this.validator})
      : super(key: key);

  @override
  State<PasswordTextForm> createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool passwordMode = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(top: 15),
      child: Material(
        elevation: 4,
        child: TextFormField(
          obscureText: passwordMode,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passwordMode = !passwordMode;
                  });
                },
                icon: passwordMode
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : const Icon(Icons.visibility, color: Colors.black)),
            hintText: widget.hintText,
          ),
        ),
      ),
    );
  }
}
