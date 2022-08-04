import 'package:animated_ui/screens/login/widgets/input_field.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            InputField(hint: "Username", icon: Icons.person_outline),
            InputField(hint: "Password", icon: Icons.lock_outline, obscure: true,)
          ],
        )
        ),
    );
  }
}