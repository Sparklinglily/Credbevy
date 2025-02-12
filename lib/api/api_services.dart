// ignore_for_file: depend_on_referenced_packages

import 'package:credbevy/api/api_endpoints.dart';
import 'package:credbevy/data/models/all_beneficiaries.dart';
import 'package:credbevy/data/models/all_expenses.dart';
import 'package:credbevy/data/models/balance.dart';
import 'package:credbevy/data/models/cards.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<List<CardModel>> getCardDetails() async {
    try {
      final response = await _dio.get(ApiEndpoints.allCreditCards);

      if (response.data is Map<String, dynamic> &&
          response.data.containsKey('data')) {
        List jsonList = response.data['data'];
        final cardList = jsonList.map((e) => CardModel.fromJson(e)).toList();

        return cardList;
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<BalanceResponse> getBalance() async {
    try {
      final response = await _dio.get(ApiEndpoints.balance);

      if (response.data is Map<String, dynamic>) {
        final balance = BalanceResponse.fromJson(response.data);
        return balance;
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ExpenseModel>> getExpenses() async {
    try {
      final response = await _dio.get(ApiEndpoints.expenses);

      if (response.data is Map<String, dynamic> &&
          response.data.containsKey('data')) {
        List jsonList = response.data['data'];
        final expenseList =
            jsonList.map((e) => ExpenseModel.fromJson(e)).toList();

        return expenseList;
      } else {
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel>> getAllBeneficiaries() async {
    try {
      final response = await _dio.get(ApiEndpoints.allBeneficiaries);

      if (response.data is Map<String, dynamic> &&
          response.data.containsKey('data')) {
        List jsonList = response.data['data'];
        final allBeneficiaries =
            jsonList.map((e) => UserModel.fromJson(e)).toList();
        print("List: ${allBeneficiaries.toString()}");
        return allBeneficiaries;
      } else {
        print("Unexpected data format: ${response.data.runtimeType}");
        throw Exception("Unexpected data format");
      }
    } catch (e) {
      print("Error fetching cards: $e");
      rethrow;
    }
  }
}
