import 'package:credit_card_project/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final Future<void> Function() onPressed;
  final dynamic controller;

  const CustomPrimaryButton({
    super.key,
    required this.buttonColor,
    required this.textValue,
    required this.textColor,
    required this.onPressed,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // final isLoading = RxBool(false);
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: Obx(
            () => InkWell(
              onTap: onPressed,
              //  () async {
              //   if (!isLoading.value) {
              //     isLoading.value = true;

              //     try {
              //       await onPressed();
              //     } finally {
              //       isLoading.value = false;
              //     }
              //   }
              // },
              borderRadius: BorderRadius.circular(14.0),
              child: Center(
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        textValue,
                        style: heading5.copyWith(color: textColor),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class CustomPrimaryButton extends StatelessWidget {
//   final Color buttonColor;
//   final String textValue;
//   final Color textColor;
//   final Future<void> Function() onPressed;

//   const CustomPrimaryButton({
//     super.key,
//     required this.buttonColor,
//     required this.textValue,
//     required this.textColor,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       borderRadius: BorderRadius.circular(14.0),
//       elevation: 0,
//       child: Container(
//         height: 56,
//         decoration: BoxDecoration(
//           color: buttonColor,
//           borderRadius: BorderRadius.circular(14.0),
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: Obx(
//             () => InkWell(
//               onTap: () async {
//                 if (!isLoading.value) {
//                   // Only trigger onPressed if not loading
//                   isLoading.value = true;
//                   try {
//                     await onPressed();
//                   } finally {
//                     isLoading.value = false;
//                   }
//                 }
//               },
//               borderRadius: BorderRadius.circular(14.0),
//               child: Center(
//                 child: isLoading.value
//                     ? const CircularProgressIndicator()
//                     : Text(
//                         textValue,
//                         style: heading5.copyWith(color: textColor),
//                       ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
