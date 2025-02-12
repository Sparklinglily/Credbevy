import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/data/models/all_beneficiaries.dart';
import 'package:credbevy/data/models/balance.dart';
import 'package:stacked/stacked.dart';

class TransferMoneyViewmodel extends BaseViewModel {
  int _selectedIndex = -1;

  int get selectedIndex => _selectedIndex;
  List<UserModel>? _beneficiaries = [];
  List<UserModel>? get beneficiaries => _beneficiaries;
  BalanceResponse? _balanceResponse;
  BalanceResponse? get balanceResponse => _balanceResponse;

  void selectCard(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Future<void> init() async {
    await fetchBalance();
    await fetchAllBeneficiaries();
    notifyListeners();
  }

  Future<void> fetchBalance() async {
    setBusy(true);
    try {
      _balanceResponse = await apiServices.getBalance();

      notifyListeners();
    } catch (e) {
      print("Error fetching balance: $e");
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchAllBeneficiaries() async {
    setBusy(true);
    try {
      _beneficiaries = await apiServices.getAllBeneficiaries();

      notifyListeners();
      print("Balance fetched");
    } catch (e) {
      print("Error fetching balance: $e");
    } finally {
      setBusy(false);
    }
  }
}
