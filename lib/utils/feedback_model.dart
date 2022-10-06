// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

List<FeedbackModel> feedbackModelFromJson(String str) =>
    List<FeedbackModel>.from(
        json.decode(str).map((x) => FeedbackModel.fromJson(x)));

String feedbackModelToJson(List<FeedbackModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedbackModel {
  FeedbackModel({
    required this.profilePic,
    required this.name,
    required this.feedback,
  });

  String profilePic;
  String name;
  String feedback;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        profilePic: json["profile_pic"],
        name: json["name"],
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "profile_pic": profilePic,
        "name": name,
        "feedback": feedback,
      };
}
