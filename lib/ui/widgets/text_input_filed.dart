import 'package:flutter/material.dart';

class TextInputFiled extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isPass;
  final IconData? suffix;
  final IconData ? prefix;
  final TextInputType textInputType;

  const TextInputFiled({super.key, required this.hintText,
    required this.textEditingController,
     this.isPass=false,
    required this.textInputType,  this.suffix,  this.prefix,});

  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(

      borderSide: BorderSide(color: Colors.blueAccent),
    );
    return TextFormField(
      
      controller:textEditingController,
      
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: Icon(suffix),
        hintText:hintText,
        border: inputBorder,

        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
        

      ),
      obscureText:isPass,
      keyboardType:textInputType,
    );
  }
}
