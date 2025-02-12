import 'package:credbevy/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class TransactionCard extends StatelessWidget {
  final String month;
  final String amount;

  const TransactionCard({super.key, required this.month, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      shadowColor: const Color.fromARGB(255, 192, 191, 191),
      color: AppColors.white,
      child: ListTile(
        title: Text(
          month,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
