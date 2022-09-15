import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderPasswordField extends StatefulWidget {
  final String name;
  final String? Function(String?)? validator;
  final String? label;
  final String? hint;

  const FormBuilderPasswordField(
      {Key? key, required this.name, this.validator, this.label, this.hint})
      : super(key: key);

  @override
  State<FormBuilderPasswordField> createState() =>
      _FormBuilderPasswordFieldState();
}

class _FormBuilderPasswordFieldState extends State<FormBuilderPasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  InputDecoration withSuffixIcon() {
    return InputDecoration(
      labelText: widget.label,
      hintText: widget.hint,
      border: const OutlineInputBorder(),
      suffixIcon: IconButton(
        onPressed: _toggle,
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      obscureText: _obscureText,
      decoration: withSuffixIcon(),
      validator: widget.validator,
    );
  }
}
