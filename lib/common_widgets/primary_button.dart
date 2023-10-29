import 'package:flutter/material.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.text, this.isLoading = false, this.onPressed});
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.surface),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: theme
                    .textTheme
                    .titleLarge!
                    .copyWith(color: theme.colorScheme.primary),
              ),
      ),
    );
  }
}
