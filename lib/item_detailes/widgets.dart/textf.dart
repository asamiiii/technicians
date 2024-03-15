// ignore: must_be_immutable
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextInputType keyboardType;
  Widget icon;
  String hintText;
  int maxLines;
  bool? isOnChange = false;
  double? totalDept = 0;
  bool? readOnly = false;
  String? label;
  bool? isValid = true;
  Function? onTap;
  AppTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.icon,
      required this.hintText,
      this.maxLines = 1,
      this.isOnChange,
      this.totalDept,
      this.readOnly = false,
      this.onTap,
      // this.isValid=true,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        readOnly: readOnly!,
        autofocus: true,
        maxLines: maxLines,
        onTap: () {
          debugPrint('aa');
          onTap!() ?? () {};
        },
        style: const TextStyle(
          fontSize: 15,
        ),
        textDirection: TextDirection.rtl,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            // errorText:isValid == false? AppErrorsStrings.requiredField : null,
            contentPadding: const EdgeInsets.all(20.0),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: icon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: hintText,
            hintTextDirection: TextDirection.rtl,
            labelText: label));
  }
}