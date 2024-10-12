import 'package:flutter/material.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        Expanded(
          child: Text("Saya menyetujui semua kondisi dan persyaratan"),
        ),
      ],
    );
  }
}
