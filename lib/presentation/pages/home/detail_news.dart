import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/extension/date.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../getx/news/news_controller.dart';

class NewsDetailPage extends StatelessWidget {
  final int newsId;

  NewsDetailPage({required this.newsId}) {
    final NewsController controller = Get.find();
    // Memastikan data diambil hanya sekali
    if (controller.newsDetail.value == null) {
      controller.fetchNewsDetail(newsId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final NewsController controller = Get.find();

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

        final newsDetail = controller.newsDetail.value;

        if (newsDetail == null) {
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
                    newsDetail.title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        newsDetail.publishedAt.formatDateTime(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwItems,
                  ),
                  Center(
                    child: Image.network(
                      newsDetail.image,
                      width: 270,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(
                    height: CustomSizes.spaceBtwSections,
                  ),
                  HtmlWidget(
                    newsDetail.description ?? "",
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
