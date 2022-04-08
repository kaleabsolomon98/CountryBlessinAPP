import 'package:countyourblessings/view/constant/other.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var labelText, hintText;
  bool? obSecure;
  double? bottomPadding;
  TextEditingController? controller = TextEditingController();

  MyTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.bottomPadding = 25.0,
    this.controller,
    this.obSecure = false,
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: widget.bottomPadding!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${widget.labelText}',
            style: TextFieldStyling.labelStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: widget.controller,
            style: TextFieldStyling.textStyle,
            obscureText: widget.obSecure!,
            obscuringCharacter: "*",
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              hintText: '${widget.hintText}',
              hintStyle: TextFieldStyling.hintStyle,
              enabledBorder: TextFieldStyling.noBorder,
              focusedBorder: TextFieldStyling.noBorder,
            ),
          ),
        ],
      ),
    );
  }
}
