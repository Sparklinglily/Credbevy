class BalanceResponse {
  final bool error;
  final String message;
  final double data;

  BalanceResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) {
    return BalanceResponse(
      error: json['error'],
      message: json['message'],
      data: (json['data'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data,
    };
  }
}
