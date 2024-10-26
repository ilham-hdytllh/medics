import 'package:medics/data/models/answer.dart';

class QuestionModel {
  int id;
  int questionCategoryId;
  String title;
  int sortOrder;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Answer> answers;

  QuestionModel({
    required this.id,
    required this.questionCategoryId,
    required this.title,
    required this.sortOrder,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        questionCategoryId: json["question_category_id"],
        title: json["title"],
        sortOrder: json["sort_order"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        answers: List<Answer>.from(json["answers"].map((answer) => answer)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question_category_id": questionCategoryId,
        "title": title,
        "sort_order": sortOrder,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "answers": List<dynamic>.from(answers.map((x) => x)),
      };
}
