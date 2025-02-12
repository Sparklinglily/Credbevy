class ExpenseModel {
  final String month;
  final double amountSpent;

  ExpenseModel({
    required this.month,
    required this.amountSpent,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      month: json['month'],
      amountSpent: (json['amount_spent'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'month': month,
      'amount_spent': amountSpent,
    };
  }
}

class ExpenseResponse {
  final bool error;
  final String message;
  final List<ExpenseModel> data;

  ExpenseResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory ExpenseResponse.fromJson(Map<String, dynamic> json) {
    return ExpenseResponse(
      error: json['error'],
      message: json['message'],
      data:
          (json['data'] as List).map((e) => ExpenseModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
