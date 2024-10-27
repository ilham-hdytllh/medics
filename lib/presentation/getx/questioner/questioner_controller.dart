import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medics/core/utils/helpers/shared_preference.dart';
import 'package:medics/data/models/question.dart';
import 'package:medics/data/repositories/questioner/questioner_repository.dart';

class QuestionerFirstController extends GetxController {
  RxList<QuestionModel> questionFirstData = <QuestionModel>[].obs;
  PageController pageController = PageController();
  RxInt index = 0.obs;
  RxList<Map<String, int>> selectedAnswers = <Map<String, int>>[].obs;

  @override
  void onInit() async {
    await fetchQuestionerFirst();
    super.onInit();
  }

  bool checkBoxTrueOrNot(int answerId) {
    return selectedAnswers.any((element) => element['answer_id'] == answerId);
  }

  void addAnswerToMap(int questionId, int answerId) {
    bool checkQuestion =
        selectedAnswers.any((element) => element['question_id'] == questionId);
    if (checkQuestion) {
      selectedAnswers
          .removeWhere((element) => element['question_id'] == questionId);
      selectedAnswers.add(
        {"question_id": questionId, "answer_id": answerId},
      );
    } else {
      selectedAnswers.add(
        {"question_id": questionId, "answer_id": answerId},
      );
    }

    print(selectedAnswers);
    update();
  }

  nextPage() {
    if (index.value < questionFirstData.length - 1) {
      index.value++;
      pageController.jumpToPage(index.value);
    }
  }

  prevPage() {
    if (index.value > 0) {
      index.value--;
      pageController.jumpToPage(index.value);
    }
  }

  Future<void> fetchQuestionerFirst() async {
    try {
      String? _token = await SharedPreferencesHelper.getToken();

      List<QuestionModel> listData =
          await QuestionRepository.instance.fecthQuestionerFirst(_token);

      questionFirstData.addAll(listData);
    } catch (e) {
      print(e);
    }
  }
}
