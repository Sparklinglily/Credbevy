import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/data/models/all_expenses.dart';
import 'package:credbevy/data/models/cards.dart';
import 'package:stacked/stacked.dart';

class HomeViewmodel extends BaseViewModel {
  String? _theError = "";
  String? get theError => _theError;
  List<ExpenseModel> _expenses = [];
  List<ExpenseModel> get expenses => _expenses;
  List<CardModel> _cards = [];
  List<CardModel> get card => _cards;
  Future<void> init() async {
    await fetchCards();
    await fetchExpenses();

    notifyListeners();
  }

  Future<void> fetchCards() async {
    setBusy(true);
    try {
      _cards = await apiServices.getCardDetails();

      notifyListeners();
    } catch (e) {
      _theError = e.toString();

      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  Future<void> fetchExpenses() async {
    setBusy(true);
    try {
      _expenses = await apiServices.getExpenses();
      print("$expenses: succesfuly done the job");
      notifyListeners();
    } catch (e) {
      _theError = e.toString();

      notifyListeners();
    } finally {
      setBusy(false);
    }
  }
}
