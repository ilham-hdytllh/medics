import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medics/core/constants/image_strings.dart';

import '../../../core/constants/sizes.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alarm"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              CustomImages.development,
              height: 125,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              height: CustomSizes.spaceBtwItems,
            ),
            Text(
              "Sedang Development",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
