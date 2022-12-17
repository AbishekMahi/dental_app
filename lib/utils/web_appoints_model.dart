// To parse this JSON data, do
//
//     final webAppointsModel = webAppointsModelFromJson(jsonString);

import 'dart:convert';

List<WebAppointsModel> webAppointsModelFromJson(String str) =>
    List<WebAppointsModel>.from(
        json.decode(str).map((x) => WebAppointsModel.fromJson(x)));

String webAppointsModelToJson(List<WebAppointsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WebAppointsModel {
  WebAppointsModel({
    required this.timestamp,
    required this.name,
    required this.phone,
    required this.appointDate,
    required this.appointTime,
    required this.appointType,
    required this.message,
  });

  DateTime timestamp;
  String name;
  int phone;
  DateTime appointDate;
  String appointTime;
  String appointType;
  String message;

  factory WebAppointsModel.fromJson(Map<String, dynamic> json) =>
      WebAppointsModel(
        timestamp: DateTime.parse(json["timestamp"]),
        name: json["name"],
        phone: json["phone"],
        appointDate: DateTime.parse(json["appoint_date"]),
        appointTime: (json["appoint_time"]),
        appointType: json["appoint_type"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "name": name,
        "phone": phone,
        "appoint_date": appointDate,
        "appoint_time": appointTime,
        "appoint_type": appointType,
        "message": message,
      };
}
