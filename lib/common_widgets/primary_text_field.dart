import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PrimaryTextField extends StatefulWidget {
  PrimaryTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.autovalidateMode,
    this.validator,
    this.autocorrect = true,
    this.textInputAction,
    this.keyboardType,
    this.keyboardAppearance,
    this.onEditingComplete,
    this.inputFormatters,
    this.obscureText = false,
    this.isSecure = false,
    this.isPassword = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.initialValue,
  });
  final String hintText;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  final bool autocorrect;
  final bool obscureText;
  final bool isSecure;
  bool isPassword;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Brightness? keyboardAppearance;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final String? initialValue;


  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        autovalidateMode: widget.autovalidateMode,
        validator: widget.validator,
        style: Theme.of(context).textTheme.bodyMedium,
        autocorrect: widget.autocorrect,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        keyboardAppearance: Brightness.light,
        onEditingComplete: widget.onEditingComplete,
        inputFormatters: widget.inputFormatters,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          hintText: widget.hintText,
          filled: true,
          suffixIcon: widget.isSecure
              ? GestureDetector(
            onTap: () {
              setState(() {
                widget.isPassword = !widget.isPassword;
              });
            },
            child: Icon(
              widget.isPassword ? Icons.visibility : Icons.visibility_off,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          )
              : null,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
              BorderSide(color: theme.colorScheme.outline, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
              BorderSide(color: theme.colorScheme.error, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
              BorderSide(color: theme.colorScheme.outline, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide:
              BorderSide(color: theme.colorScheme.primary, width: 2.0)),
        ),
      ),
    );
  }
}
