import 'package:flutter/material.dart';

class InputString extends StatelessWidget {
  const InputString({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Name"),
        TextField(

        ),
      ],
    );
  }
}
