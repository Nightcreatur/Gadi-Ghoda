import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoustomTextField extends StatefulWidget {
  const CoustomTextField(
      {Key? key,
      required this.hintText,
      required this.text,
      required this.controller,
      this.isPass = false,
      this.icon})
      : super(key: key);
  final String hintText;
  final String text;
  final bool isPass;
  final Icon? icon;
  final TextEditingController controller;

  @override
  State<CoustomTextField> createState() => _CoustomTextFieldState();
}

class _CoustomTextFieldState extends State<CoustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (text) => setState(() {
        widget.controller.text = text;
      }),
      obscureText: widget.isPass,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return "${widget.text} can't be empty";
        }
        if (EmailValidator.validate(text) == true) {
          return null;
        }
        if (text.length < 2 || text.length > 49) {
          return "Please enter a valid ${widget.text}";
        }

        return '';
      },
      inputFormatters: [LengthLimitingTextInputFormatter(50)],
      controller: widget.controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey.shade200,
          hintText: widget.text,
          prefixIcon: widget.icon),
    );
  }
}
