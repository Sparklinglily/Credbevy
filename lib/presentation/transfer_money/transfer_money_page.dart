// ignore_for_file: depend_on_referenced_packages

import 'package:credbevy/core/constants/app_assets.dart';
import 'package:credbevy/core/constants/app_colors.dart';
import 'package:credbevy/core/constants/dependency_injection/locator.dart';
import 'package:credbevy/presentation/transfer_money/transfer_money_viewmodel.dart';
import 'package:credbevy/presentation/transfer_succesful/transfer_succesful_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:stacked/stacked.dart';

class TransferMoneyPage extends StatelessWidget {
  final int userId;

  const TransferMoneyPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        //onModelReady: (viewModel) => viewModel.selectSingleBeneficiary(userId),
        viewModelBuilder: () => TransferMoneyViewmodel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.white,
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
                        AppAssets.home,
                        height: 20,
                        width: 20,
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
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("Current Balance",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textColor)),
                        buildBalance(model, context),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size(130, 36),
                                        side: BorderSide(
                                            color: AppColors.blackColor)),
                                    onPressed: () {},
                                    label: Text("Favourites"),
                                    icon: SvgPicture.asset(AppAssets.star)),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton.icon(
                                    style: OutlinedButton.styleFrom(
                                        minimumSize: Size(130, 36),
                                        side: BorderSide(
                                            color: AppColors.blackColor)),
                                    onPressed: () {},
                                    label: Text("All Friends"),
                                    icon:
                                        SvgPicture.asset(AppAssets.allFriends)),
                              ],
                            ),
                            Flexible(
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: size.height * 0.2,
                            child: buildBeneficiaryList(model, context)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Name"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: TextEditingController(
                            text: model.selectedUser?.fullName ?? "",
                          ),
                          decoration: InputDecoration(
                            hintText: "",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color.fromARGB(255, 161, 151, 151)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Amount \$"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: model.amountController,
                          decoration: InputDecoration(
                            hintText: "How much do you want to send",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color.fromARGB(255, 161, 151, 151)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  borderRadius: BorderRadius.circular(23)),
                              child: Text(
                                "+10",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  borderRadius: BorderRadius.circular(23)),
                              child: Text(
                                "+100",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  borderRadius: BorderRadius.circular(23)),
                              child: Text(
                                "-10",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.blackColor),
                                  borderRadius: BorderRadius.circular(23)),
                              child: Text(
                                "+100",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Reference"),
                        SizedBox(
                          height: 5,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "What is this transfer for",
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color:
                                    const Color.fromARGB(255, 161, 151, 151)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            model.transferMoney();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            backgroundColor: AppColors.blackColor,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          icon: SvgPicture.asset(AppAssets.transfer),
                          label: model.isBusy
                              ? CircularProgressIndicator()
                              : const Text(
                                  "Send Money",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  Widget buildBalance(TransferMoneyViewmodel model, BuildContext context) {
    if (model.isBusy) {
      return CircularProgressIndicator();
    } else if (model.balanceResponse == null) {
      return Text("Balance not available",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.textColor));
    } else {
      return Text(
        model.balanceResponse!.data.toString(),
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),
      );
    }
  }

  Widget buildBeneficiaryList(
      TransferMoneyViewmodel model, BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if (model.isBusy) {
      return Center(child: CircularProgressIndicator());
    } else if (model.beneficiaries == null || model.beneficiaries!.isEmpty) {
      return Center(child: Text("No beneficiaries found"));
    } else {
      return ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: model.beneficiaries!.length,
        itemBuilder: (context, index) {
          final beneficiary = model.beneficiaries![index];
          //final isSelected = model.selectedUser?.id == beneficiary.id;
          bool isSelected = index == model.selectedIndex;

          return GestureDetector(
            onTap: () {
              model.selectCard(index);
              // model.selectSingleBeneficiary(index);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                color: isSelected ? AppColors.primaryColor : AppColors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(8),
              width: size.width * 0.32,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: beneficiary.image.isEmpty
                        ? NetworkImage(beneficiary.image)
                        : AssetImage(AppAssets.walter),
                  ),
                  SizedBox(height: 5),
                  FittedBox(
                    child: Text(
                      beneficiary.fullName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:
                            isSelected ? AppColors.white : AppColors.blackColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SvgPicture.asset(
                    AppAssets.star,
                    color:
                        isSelected ? AppColors.white : AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 14),
      );
    }
  }
}
