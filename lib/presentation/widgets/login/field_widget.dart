import 'package:flutter/material.dart';

class FieldWidget extends StatefulWidget {
  const FieldWidget(
      {super.key, required this.hintText, required this.oscureText});

  final String hintText;
  final bool oscureText;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  double horizontalValue = 20;
  double verticalValue = 10;
  double borderRadiusValue = 8.0;

  bool viewPass = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalValue,
        vertical: verticalValue,
      ),
      child: TextFormField(
          obscureText: widget.oscureText,
          decoration: InputDecoration(
            labelText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusValue),
            ),
            suffixIcon: widget.oscureText
                ? IconButton(
                    icon: Icon(
                      viewPass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        viewPass = !viewPass;
                      });
                    },
                  )
                : const Icon(Icons.email),
          )),
    );
  }
}
