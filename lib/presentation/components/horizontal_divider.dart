import 'package:flutter/material.dart';
import 'package:in_pos_multimerchant/utils/constants/colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 2,
      color: TColors.grey,
    );
  }
}
