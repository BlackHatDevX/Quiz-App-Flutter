import 'package:flutter/material.dart';

class OptionBtn extends StatelessWidget {
  const OptionBtn({required this.data, required this.onTap, super.key});
  final String data;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: onTap, child: Text(textAlign: TextAlign.center, data));
  }
}
