import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key key,
    @required this.controller,
    this.hintText,
    this.initialValue,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixAction,
    this.inputType,
    this.textCapitalization,
    this.validator,
    this.inputFormatters,
    this.obscureText = false,
    this.isEnabled,
    this.color,
    this.fontSize,
    this.fillColor,
    this.onChanged,
    this.onSubmitted,
    this.centerText,
    this.readOnly = false,
    this.errorMessage,
    this.cursoColor,
    this.onSaved,
    this.textColor, this.labelColor,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String initialValue;
  final String label;

  final Widget prefix;
  final Widget suffix;
  final Function suffixAction;

  final TextInputType inputType;
  final TextCapitalization textCapitalization;
  final FormFieldValidator validator;
  final List<TextInputFormatter> inputFormatters;
  final bool obscureText;
  final bool isEnabled;
  final color;
  final textColor;
  final labelColor;
  final cursoColor;
  final fontSize;
  //fontSize isn't uesd as at now
  final fillColor;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final bool centerText;
  final bool readOnly;
  final String errorMessage;

  final void Function(String) onSaved;

  @override
  _AuthTextFieldState createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
 String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              color: widget.labelColor ?? Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: TextFormField(
            // The validator receives the text that the user has entered.

            cursorColor: Colors.black,
            readOnly: widget.readOnly,
            style: TextStyle(color:widget.textColor?? Colors.white),
            keyboardType: widget.inputType,
            obscureText: widget.obscureText,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              //  errorText: widget.errorMessage,
              hintStyle: TextStyle(color: Colors.white),
              hintText: widget.hintText,
              focusedBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              fillColor: widget.fillColor ?? Color(0xFF003A58),
              filled: true,

              contentPadding: EdgeInsets.only(top: 22, bottom: 22, left: 15),

              errorText: widget.errorMessage,
              errorStyle: TextStyle(fontSize: 12),

              prefix: widget.prefix == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: widget.prefix,
                    ),
              suffix: widget.suffix == null
                  ? null
                  : InkWell(
                      onTap: widget.suffixAction,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: widget.suffix,
                      ),
                    ),
            ),

            validator: (String val) {
              // For optional fields in forms, don't validate.
              // Just return a null error text. This means there is no validation
              // error text to display
              if (widget.validator == null) return null;

              setState(() {
                error = widget.validator(val);
              });
              return error;
            },

            onSaved: (String value) {
              widget.onSaved(value);
              setState(() {
                error = null;
              });
            },
            onChanged: (String val) {
              widget.onChanged(val);
            },
            controller: widget.controller,
          ),
        ),
      ],
    );
  }
}
