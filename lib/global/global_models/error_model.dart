class ErrorModel {
  final int status;
  final String message;

  ErrorModel({
    required this.status,
    required this.message,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      status: json['status'],
      message: json['message'],
    );
  }

  @override
  String toString() {
    return 'ErrorModel{status: $status, message: $message}';
  }
}
