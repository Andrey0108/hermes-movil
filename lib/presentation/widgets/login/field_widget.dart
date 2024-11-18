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
  bool viewPass = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
          obscureText: widget.oscureText,
          decoration: InputDecoration(
            focusColor: Colors.blue,
            fillColor: Colors.blue,
            labelText: widget.hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.blue,
              ),
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
