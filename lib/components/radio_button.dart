import 'package:flow/models/radio_model.dart';
import 'package:flow/utils/asset.dart' as Asset;
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  RadioButton({this.radioModel});

  final RadioModel radioModel;

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    RadioModel radio = widget.radioModel;
    return Container(
      height: 67.0,
      child: Center(
        child: Text(radio.label,
            style: TextStyle(
                color: radio.isSelected ? Colors.white : Colors.black,
                fontSize: 18.0)),
      ),
      decoration: BoxDecoration(
        color: radio.isSelected ? Asset.Colors.purple : Colors.transparent,
        border: Border.all(
          width: 1.0,
          color: Asset.Colors.purple,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }
}