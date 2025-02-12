// ignore_for_file: depend_on_referenced_packages

import 'package:credbevy/core/constants/app_assets.dart';
import 'package:credbevy/core/constants/app_colors.dart';
import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/presentation/home/home_viewmodel.dart';
import 'package:credbevy/presentation/home/widgets/bank_card.dart';
import 'package:credbevy/presentation/home/widgets/transaction_card.dart';
import 'package:credbevy/presentation/transfer_money/transfer_money_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ViewModelBuilder.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.grey),
                  child: SvgPicture.asset(
                    AppAssets.more,
                    height: 10,
                    width: 10,
                  )),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage(AppAssets.profilepic),
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "My Cards",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: size.height * 0.22,
                        child: buildCardList(model, context)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Transaction History",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SvgPicture.asset(AppAssets.filter)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    buildExpensesList(model, context)
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: SvgPicture.asset(AppAssets.analytics),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      label: const Text(
                        "Analytics",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColor),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        navigationService.push(TransferMoneyPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      icon: SvgPicture.asset(AppAssets.transfer),
                      label: const Text(
                        "Send Money",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget buildCardList(HomeViewmodel model, BuildContext context) {
    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (model.hasError) {
      return Center(child: Text("Error: ${model.theError}"));
    } else if (model.card.isEmpty) {
      return Center(child: Text("No cards found"));
    } else {
      return ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Color cardColor = index == 1 ? AppColors.blue : AppColors.pink2;
            final card = model.card[index];
            return SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: BankCard(
                    cardColor: cardColor,
                    bankName: card.bankName,
                    cardName: card.name,
                    cardNumber: card.cardNumber,
                    cardType: card.cardType,
                    expiryDate: card.expiryDate));
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 14,
              ),
          itemCount: model.card.length);
    }
  }

  Widget buildExpensesList(HomeViewmodel model, BuildContext context) {
    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (model.hasError) {
      return Center(child: Text("Error: ${model.theError}"));
    } else if (model.expenses.isEmpty) {
      return Center(child: Text("No Expenses found"));
    } else {
      return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final expense = model.expenses[index];
            return TransactionCard(
              month: expense.month,
              amount: expense.amountSpent.toString(),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ));
    }
  }
}
