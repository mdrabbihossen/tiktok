import 'package:flutter/material.dart';

class DialogOption extends StatelessWidget {
  final IconData optionsIcon;
  final String optionsText;
  final VoidCallback onClick;

  const DialogOption({
    Key? key,
    required this.optionsIcon,
    required this.optionsText,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClick,
        child: Row(
          children: [
            Icon(optionsIcon),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Text(
                optionsText,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      );
}
