import 'package:flutter/material.dart';
import 'package:hermes/presentation/values.dart';

class FieldWidget extends StatefulWidget {
  final String hintText;
  final bool oscureText;
  final TextEditingController controller; // Add this property

  const FieldWidget({
    super.key,
    required this.hintText,
    required this.oscureText,
    required this.controller, // Make it required in the constructor
  });

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  bool viewPass = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Assign the controller here
      obscureText:
          widget.oscureText && !viewPass, // Modify this to use viewPass
      decoration: InputDecoration(
        labelText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        suffixIcon: widget.oscureText
            ? IconButton(
                icon: Icon(viewPass ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    viewPass = !viewPass;
                  });
                },
              )
            : const Icon(Icons.email),
      ),
    );
  }
}
