// // ignore_for_file: depend_on_referenced_packages

// import 'package:credbevy/core/constants/app_assets.dart';
// import 'package:credbevy/core/constants/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class BeneficiaryCard extends StatelessWidget {
//   const BeneficiaryCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//                                     decoration: BoxDecoration(
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: AppColors.blackColor
//                                                 .withOpacity(0.1),
//                                             spreadRadius: 1,
//                                             blurRadius: 5,
//                                             offset: Offset(0, 3),
//                                           ),
//                                         ],
//                                         color: isSelected
//                                             ? AppColors.primaryColor
//                                             : AppColors.white,
//                                         borderRadius:
//                                             BorderRadius.circular(16)),
//                                     padding: EdgeInsets.all(16),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 20,
//                                           backgroundImage:
//                                               AssetImage(AppAssets.walter),
//                                         ),
//                                         SizedBox(
//                                           height: 5,
//                                         ),
//                                         Text("Walter White",
//                                             style: TextStyle(
//                                                 fontSize: 16,
//                                                 fontWeight: FontWeight.w400,
//                                                 color: isSelected
//                                                     ? AppColors.white
//                                                     : AppColors.blackColor)),
//                                         SizedBox(
//                                           height: 10,
//                                         ),
//                                         SvgPicture.asset(AppAssets.star,
//                                             color: isSelected
//                                                 ? AppColors.white
//                                                 : AppColors.primaryColor),
//                                       ],
//                                     ),
//                                   ),;
//   }
// }
