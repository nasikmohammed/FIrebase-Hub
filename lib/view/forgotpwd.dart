import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScreenResetPwd extends StatelessWidget {
  const ScreenResetPwd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(),
          OutlinedButton(onPressed: () {}, child: Text("Sent Reset link"))
        ],
      ),
    );
  }
}
