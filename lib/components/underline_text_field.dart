import 'package:flow_chat/utils//constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnderlineTextField extends StatefulWidget {
  UnderlineTextField(
      {this.keyboardType,
      this.hintText,
      @required this.onChanged,
      this.textValue,
      this.obscureText = false,
      this.textAlign = TextAlign.start,
      this.inputFormatters,
      this.validator,
      this.onTab});

  final TextInputType keyboardType;
  final String hintText;
  final Function onChanged;
  final bool obscureText;
  final String textValue;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatters;
  final Function validator;
  final Function onTab;

  @override
  _UnderlineTextFieldState createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = widget.textValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: widget.validator,
        controller: _textController,
        obscureText: widget.obscureText,
        textAlign: widget.textAlign,
        keyboardType: widget.keyboardType,
        decoration: textFieldDecoration.copyWith(
          hintText: widget.hintText,
        ),
        onTap: widget.onTab,
        onChanged: widget.onChanged,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
