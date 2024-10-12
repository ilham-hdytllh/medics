import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';

class CardFlyer extends StatelessWidget {
  const CardFlyer({
    super.key,
    required this.child,
    this.onTapCard,
    required this.image,
  });

  final Widget child;
  final String image;
  final void Function()? onTapCard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(CustomSizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSizes.cardRadiusLg),
          color: CustomColors.white,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
