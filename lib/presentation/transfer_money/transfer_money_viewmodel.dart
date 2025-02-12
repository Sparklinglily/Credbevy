// ignore_for_file: depend_on_referenced_packages

import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/data/models/all_beneficiaries.dart';
import 'package:credbevy/data/models/balance.dart';
import 'package:credbevy/data/models/transfer.dart';
import 'package:credbevy/presentation/transfer_succesful/transfer_succesful_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TransferMoneyViewmodel extends BaseViewModel {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController refernceController = TextEditingController();
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;
  List<UserModel>? _beneficiaries = [];
  List<UserModel>? get beneficiaries => _beneficiaries;
  BalanceResponse? _balanceResponse;
  BalanceResponse? get balanceResponse => _balanceResponse;
  UserModel? _selectedUser;
  UserModel? get selectedUser => _selectedUser;

  TransactionResponse? _transactionResponse;
  TransactionResponse? get transactionResponse => _transactionResponse;
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  void selectCard(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void selectUser(UserModel user) {
    _selectedUser = user;
    notifyListeners();
  }

  Future<void> init() async {
    await fetchBalance();
    await fetchAllBeneficiaries();
    await selectSingleBeneficiary();
    notifyListeners();
  }

  Future<void> fetchBalance() async {
    setBusyForObject(_balanceResponse, true);
    try {
      _balanceResponse = await apiServices.getBalance();

      notifyListeners();
    } catch (e) {
      throw Exception("Error fetching balance: $e");
    } finally {
      setBusy(false);
    }
  }

  Future<void> selectSingleBeneficiary() async {
    _isFetching = true;
    notifyListeners();
    setBusy(true);
    try {
      final response = await apiServices.getSingleBeneficiary();
      _selectedUser = response.data;

      nameController.text = _selectedUser?.fullName ?? "";
      notifyListeners();
    } catch (e) {
      throw Exception("Error fetching single beneficiary: $e");
    } finally {
      setBusy(false);
    }
  }

  Future<void> transferMoney() async {
    if (_selectedUser == null) {
      return;
    }

    setBusy(true);
    try {
      double amount = double.parse(amountController.text);
      _transactionResponse = await apiServices.transferMoney(
          receiverId: selectedUser!.id.toString(), amount: amount);

      if (!_transactionResponse!.error) {
        navigationService.pushReplacement(
          TransferSuccesfulPage(
            transactionResponse: _transactionResponse!,
          ),
        );
        amountController.clear();
        nameController.clear();
        notifyListeners();
      } else {
        throw Exception(_transactionResponse!.message);
      }
    } catch (e) {
      throw Exception("Error transferring money: $e");
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchAllBeneficiaries() async {
    setBusy(true);
    try {
      _beneficiaries = await apiServices.getAllBeneficiaries();

      notifyListeners();
    } catch (e) {
      throw Exception("Error fetching all beneficiaries: $e");
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}
