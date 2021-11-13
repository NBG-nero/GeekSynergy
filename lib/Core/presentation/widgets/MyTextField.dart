import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final String errorText;
  final bool obscureText;
  // final Function(String) onchanged;
  final Function(String) validator;
  final TextEditingController controller;
  const MyTextField(
      {Key key,
      this.hintText,
      this.labelText,
      this.errorText,
      this.obscureText,
      // this.onchanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(fontSize: 14.0, color: Colors.black38),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        labelText: widget.labelText,
        errorText: widget.errorText,
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: widget.controller,
      validator: (val) => widget.validator(val),
      // onChanged: (String value) {
      //   widget.onchanged(value);
      // },
    );
  }
}
