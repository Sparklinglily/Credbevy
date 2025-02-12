import 'package:credbevy/data/models/all_beneficiaries.dart';

class Transaction {
  final UserModel sender;
  final UserModel receiver;
  final double amount;

  Transaction({
    required this.sender,
    required this.receiver,
    required this.amount,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      sender: UserModel.fromJson(json['sender']),
      receiver: UserModel.fromJson(json['receiver']),
      amount: (json['amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender.toJson(),
      'receiver': receiver.toJson(),
      'amount': amount,
    };
  }
}

class TransactionResponse {
  final bool error;
  final String message;
  final Transaction transaction;

  TransactionResponse({
    required this.error,
    required this.message,
    required this.transaction,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) {
    return TransactionResponse(
      error: json['error'],
      message: json['message'],
      transaction: Transaction.fromJson(json['transaction']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'transaction': transaction.toJson(),
    };
  }
}
