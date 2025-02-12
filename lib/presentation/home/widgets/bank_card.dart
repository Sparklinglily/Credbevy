import 'package:credbevy/core/constants/app_assets.dart';
import 'package:credbevy/core/constants/app_colors.dart';
import 'package:credbevy/data/models/cards.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/svg.dart';

class BankCard extends StatelessWidget {
  final String cardNumber;
  final String cardName;
  final String expiryDate;
  final String cardType;
  final String bankName;
  final Color cardColor;
  const BankCard(
      {required this.bankName,
      required this.cardColor,
      required this.cardName,
      required this.cardNumber,
      required this.cardType,
      required this.expiryDate,
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(23)),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardType,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
              ),
              SvgPicture.asset(AppAssets.banklogo)
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            cardNumber,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NAME",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    cardName,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EXPIRY",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    expiryDate,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
