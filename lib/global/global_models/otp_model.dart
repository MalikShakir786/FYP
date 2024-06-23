class OtpModel {
  final int status;
  final String message;
  final int otp;

  OtpModel({
    required this.status,
    required this.message,
    required this.otp,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      status: json['status'],
      message: json['message'],
      otp: json['otp'],
    );
  }

}
