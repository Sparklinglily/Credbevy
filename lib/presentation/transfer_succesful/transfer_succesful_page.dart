// ignore_for_file: depend_on_referenced_packages

import 'package:credbevy/core/constants/app_assets.dart';
import 'package:credbevy/core/constants/app_colors.dart';
import 'package:credbevy/core/constants/app_widgets/app_text_span.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransferSuccesfulPage extends StatelessWidget {
  const TransferSuccesfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            SvgPicture.asset(
              AppAssets.successful,
              height: 200,
              width: 200,
            ),
            Text(
              "\$5,000",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppTextSpan(
                text1: "Transfer succesfully sent to ", text2: "Walter White"),
            Text(
              "Ref: the latest batch 99.5% pure.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
