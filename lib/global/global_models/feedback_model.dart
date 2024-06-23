import 'package:intl/intl.dart';

class FeedbackItem {
  final String id;
  final String title;
  final String review;
  final String userEmail;
  final String dateTime;

  FeedbackItem({
    required this.id,
    required this.title,
    required this.review,
    required this.userEmail,
    required this.dateTime,
  });

  // Factory method to create a FeedbackItem from JSON
  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      id: json['id'],
      title: json['title'],
      review: json['review'],
      userEmail: json['user_email'],
      dateTime: json['date_time'],
    );
  }

  // Method to format dateTime based on the 24-hour rule
  String getFormattedDateTime() {
    DateTime feedbackDateTime = DateTime.parse(dateTime);
    DateTime now = DateTime.now();
    Duration difference = now.difference(feedbackDateTime);

    if (difference.inHours >= 24) {
      // Return both date and time
      return DateFormat('HH:mm  dd/MM/yyyy').format(feedbackDateTime);
    } else {
      // Return only time
      return DateFormat('HH:mm').format(feedbackDateTime);
    }
  }
}

// Class to represent the entire feedback response
class FeedbackResponse {
  final int status;
  final String message;
  final List<FeedbackItem> data;

  FeedbackResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  // Factory method to create a FeedbackResponse from JSON
  factory FeedbackResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<FeedbackItem> dataList = list.map((i) => FeedbackItem.fromJson(i)).toList();

    return FeedbackResponse(
      status: json['status'],
      message: json['message'],
      data: dataList,
    );
  }
}
