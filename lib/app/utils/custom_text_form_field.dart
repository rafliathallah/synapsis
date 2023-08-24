import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'constants.dart';

/// createdby Rafli Athallah
/// 01/01/23 

class CustomTextFieldWidget extends StatefulWidget {
 final Function(String)? onChanged;
 final String? labelText;
 final TextStyle?labelStyle;
 final String? hint;
 final String initalValue;
 final FocusNode? focusNode;
 final FocusNode? focusNodeNext;
 final bool obscureText;
 final bool inputNumber;
 final bool? inputNumberDecimal;
 final bool enable;
 final int maxLength;
 final int maxLines;
 final double cornerRadius;
 final Color fillColor;
 final Color labelColor;
 final Color borderColor;
 final Color textFillColor;
 final Color hintColor;
 final Color errorColor;
 final bool currencyMode;
 final FormFieldSetter<String>? onSaved;
 final TextEditingController? controller;


 const CustomTextFieldWidget({super.key, this.onChanged,
    this.labelText = "Label",
    this.labelStyle,
    this.hint = "Tulis disini",
    this.initalValue = "",
    this.focusNode,
    this.focusNodeNext,
    this.maxLength = 255,
    this.maxLines = 1,
    this.enable = true,
    this.cornerRadius = 30,
    this.inputNumber = false,
    this.currencyMode = false,
    this.inputNumberDecimal = true,
    this.fillColor = Colors.white,
    this.labelColor = Colors.grey,
    this.hintColor = Colors.grey,
    this.errorColor = Colors.red,
    this.textFillColor = Colors.black,
    this.onSaved,
    this.borderColor = Colors.white,
    this.controller,
    this.obscureText = false});

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _withIconShowHideText = false;
  bool _obsText = false;
  late bool inputNumberDecimal;


  @override
  void initState() {
    super.initState();
    if(widget.obscureText){
      _withIconShowHideText = true;
      _obsText  = true;
    }
    if (!widget.inputNumber) {
      inputNumberDecimal = false;
    } else {
      inputNumberDecimal = widget.inputNumberDecimal!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // const SizedBox(height: SpaceBase.paddingM),
        // Padding(
        //   padding:  const EdgeInsets.only(left: 20),
        //   child: Text("${widget.labelText}",
        //     style: widget.labelStyle,
        //   ),
        // ),
        const SizedBox(height: SpaceBase.paddingM),
        Stack(
          children: [
            widget.controller == null ?
            TextFormField(
              validator: (val) {
                if (val == '') {
                  return "${widget.labelText} Tidak boleh kosong";
                } else {
                  return null;
                }
              },
              enabled: widget.enable,
              initialValue: widget.initalValue,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode,
              onSaved: widget.onSaved,
              style: TextStyle(color: widget.textFillColor),
              onFieldSubmitted: (val) {
                if(widget.focusNodeNext != null){
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(widget.focusNodeNext);
                } else {
                  FocusScope.of(context).unfocus();
                  return FocusScope.of(context).requestFocus(FocusNode());
                }
              },
              maxLines: widget.maxLines,
              obscureText: _obsText,
              textInputAction: widget.focusNodeNext != null ? TextInputAction.next : TextInputAction.done,
              keyboardType: widget.inputNumber == true
                  ? (widget.inputNumberDecimal! ? const TextInputType.numberWithOptions(signed: true, decimal: true) : const TextInputType.numberWithOptions(signed: true))
                  : TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.fillColor,
                hintText: widget.hint,
                hintStyle: TextStyle(color: widget.hintColor),
                errorStyle: TextStyle(color: widget.errorColor),
                counterText: "",
                labelText: widget.labelText,
                labelStyle: widget.labelStyle,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: SpaceBase.paddingL,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                ),
              ),
            ) :
            TextFormField(
              controller: widget.controller,
              validator: (val) {
                if (val == '') {
                  return "${widget.labelText} Tidak boleh kosong";
                } else {
                  return null;
                }
              },
              enabled: widget.enable,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              focusNode: widget.focusNode,
              onSaved: widget.onSaved,
              style: TextStyle(color: widget.textFillColor),
              onFieldSubmitted: (val) {
                if(widget.focusNodeNext != null){
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(widget.focusNodeNext);
                } else {
                  FocusScope.of(context).unfocus();
                  return FocusScope.of(context).requestFocus(FocusNode());
                }
              },
              maxLines: widget.maxLines,
              obscureText: _obsText,
              textInputAction: widget.focusNodeNext != null ? TextInputAction.next : TextInputAction.done,
              keyboardType: widget.inputNumber == true
                  ? (widget.inputNumberDecimal! ? const TextInputType.numberWithOptions(signed: true, decimal: true) : const TextInputType.numberWithOptions(signed: true))
                  : TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.fillColor,
                hintText: widget.hint,
                counterText: "",
                hintStyle: TextStyle(color: widget.hintColor),
                errorStyle: TextStyle(color: widget.errorColor),
                labelText: widget.labelText,
                labelStyle: widget.labelStyle,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.cornerRadius),
                  borderSide: BorderSide(
                    color: widget.borderColor,
                    width: 1.0,
                  ),
                )
              ),
            ) ,
            _withIconShowHideText == false ? Container() :
            Positioned(
              right: SpaceBase.paddingS,
              top: 0,
              child: IconButton(
                icon: _obsText == true ? const Icon(Icons.visibility_off, color: Colors.grey,) : const Icon(Icons.visibility, color: Colors.grey,),
                onPressed: (){
                  if(_obsText){
                    _obsText = false;
                  } else {
                    _obsText = true;
                  }
                  setState((){});
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  bool isNumeric(String s) {
    if(s.isEmpty) {
      return false;
    }
    // return double.parse(s, ((e) => null) as double Function(String)?) != null;
     final numericRegex = RegExp(r'^-?[0-9]+(\.[0-9]+)?$');
    return numericRegex.hasMatch(s);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, // unused.
      TextEditingValue newValue,
      ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (truncated.isEmpty) {
      return TextEditingValue(
        text: "",
        selection: newSelection,
        composing: TextRange.empty,
      );
    }

    if (!isNumeric(truncated) || truncated.contains(" ")) {
      return TextEditingValue(
        text: oldValue.text,
        selection: oldValue.selection,
        composing: TextRange.empty,
      );
    }

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
