import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:medics/core/constants/colors.dart';
import 'package:medics/core/utils/extension/capitalize.dart';
import 'package:medics/core/utils/extension/date.dart';
import 'package:medics/presentation/getx/events/event_controller.dart';
import '../../../core/constants/sizes.dart';

class EventDetailPage extends StatelessWidget {
  final int eventID;

  EventDetailPage({required this.eventID}) {
    final EventController controller = Get.find();
    // Memastikan data diambil hanya sekali
    if (controller.eventDetail.value == null) {
      controller.fetchEventDetail(eventID);
    }
  }

  @override
  Widget build(BuildContext context) {
    final EventController controller = Get.find();

    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: CustomColors.primary,
              ),
            ),
          );
        }

        final eventDetail = controller.eventDetail.value;

        if (eventDetail == null) {
          return Center(child: Text("No data found"));
        }

        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventDetail.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${eventDetail.dateOfEvent.formatDateTime()} - ${eventDetail.location.capitalizeAll()}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwItems,
                  ),
                  Center(
                    child: Image.network(
                      eventDetail.image,
                      width: 270,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  HtmlWidget(
                    eventDetail.description ?? "",
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
