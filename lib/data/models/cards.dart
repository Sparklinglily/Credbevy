class CardModel {
  final int id;
  final String cardNumber;
  final String cardType;
  final double balance;
  final String name;
  final String bankName;
  final String expiryDate;

  CardModel({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.balance,
    required this.name,
    required this.bankName,
    required this.expiryDate,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'],
      cardNumber: json['card_number'],
      cardType: json['card_type'],
      balance: (json['balance'] as num).toDouble(),
      name: json['name'],
      bankName: json['bank_name'],
      expiryDate: json['expiry_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'card_type': cardType,
      'balance': balance,
      'name': name,
      'bank_name': bankName,
      'expiry_date': expiryDate,
    };
  }

  @override
  String toString() {
    return 'CardModel(id: $id, name: $name, cardNumber: $cardNumber, bankName: $bankName, balance: $balance)';
  }
}

class CardResponse {
  final bool error;
  final String message;
  final List<CardModel> data;

  CardResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return CardResponse(
      error: json['error'],
      message: json['message'],
      data: (json['data'] as List).map((e) => CardModel.fromJson(e)).toList(),
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
