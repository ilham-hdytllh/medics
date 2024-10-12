import 'package:get/get.dart';
import 'package:medics/data/models/news.dart';
import 'package:medics/data/repositories/news/news_repository.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';

class NewsController extends GetxController {
  static NewsController get instance => Get.find();

  // Variable
  RxBool isLoading = false.obs;
  List<NewsModel> news = <NewsModel>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      // start loading
      isLoading.value = true;

      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      String? token = await SharedPreferencesHelper.getToken();

      List<NewsModel> listNews = await NewsRepository.instance.getNews(token!);

      news.addAll(listNews);
    } catch (e) {
      print(e);
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
