import 'package:flutter/material.dart';
import 'package:hermes/presentation/values.dart';

class FieldWidget extends StatefulWidget {
  final String hintText;
  final bool oscureText;
  final TextEditingController controller;

  const FieldWidget({
    super.key,
    required this.hintText,
    required this.oscureText,
    required this.controller,
  });

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  bool viewPass = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(borderRadiusValue),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.oscureText && !viewPass,
        decoration: InputDecoration(
          labelText: widget.hintText,
          labelStyle: TextStyle(
            color: Colors.lightBlue.shade400,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue),
            borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
          ),
          filled: true,
          fillColor: Colors.transparent,
          suffixIcon: widget.oscureText
              ? IconButton(
                  icon: Icon(
                    viewPass ? Icons.visibility : Icons.visibility_off,
                    color: Colors.lightBlue.shade400,
                  ),
                  onPressed: () {
                    setState(() {
                      viewPass = !viewPass;
                    });
                  },
                )
              : Icon(Icons.email, color: Colors.lightBlue.shade400),
        ),
      ),
    );
  }
}
