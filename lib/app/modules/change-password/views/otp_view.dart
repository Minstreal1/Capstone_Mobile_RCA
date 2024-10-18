// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '/modules/change-password/controllers/change_password_controller.dart';
// import '/resources/reponsive_utils.dart';
// import '/resources/text_style.dart';

// class OtpChangePasswordView extends GetView<ChangePasswordController> {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ChangePasswordController());
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//             vertical: UtilsReponsive.height(20, context),
//             horizontal: UtilsReponsive.height(15, context)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () {},
//               ),
//             ),
//             Container(
//               height: 100,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: TextConstant.subTile3(
//                         context,
//                         text: 'Kiểm tra tin nhắn của bạn',
//                       ),
//                     ),
//                     Expanded(
//                       child: Align(
//                           alignment: Alignment.topCenter,
//                           child: RichText(
//                             text: TextSpan(
//                               style: GoogleFonts.montserrat(
//                                   color: Colors.black,
//                                   fontSize: UtilsReponsive.height(14, context),
//                                   fontWeight: FontWeight.w500),
//                               children: <TextSpan>[
//                                 const TextSpan(
//                                   text:
//                                       'Chúng tôi đã gửi cho bạn số OTP gồm 6 chữ số vào email của bạn ',
//                                 ),
//                                 TextSpan(
//                                     text: '0794219xxxx',
//                                     style: GoogleFonts.montserrat(
//                                         fontSize:
//                                             UtilsReponsive.height(14, context),
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.red))
//                               ],
//                             ),
//                           )),
//                     )
//                   ]),
//             ),
//             SizedBoxConst.size(context: context),
//             OtpTextField(
//               borderRadius: BorderRadius.circular(10),
//               focusedBorderColor: const Color(0xFF5CB85C),
//               fieldWidth: UtilsReponsive.height(50, context),
//               numberOfFields: 6,
//               borderColor: const Color(0xFF5CB85C),
//               showFieldAsBox: true,
//               onCodeChanged: (String code) {},
//               onSubmit: (String verificationCode) {
//                 log('message');
//                 controller.verifyOTP(code: verificationCode);
//               }, // end onSubmit
//             ),
//             SizedBox(
//               height: UtilsReponsive.height(16, context),
//             ),
//             SizedBox(
//               height: UtilsReponsive.height(16, context),
//             ),
//             ConstrainedBox(
//               constraints: const BoxConstraints.tightFor(width: 400),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   backgroundColor: MaterialStateProperty.all(Colors.green),
//                   padding: MaterialStateProperty.all(EdgeInsets.all(14)),
//                 ),
//                 child:
//                     //  controller.isLockButton.value
//                     //     ? CircularProgressIndicator(
//                     //         color: Colors.yellow,
//                     //       )
//                     //     :
//                     TextConstant.subTile3(
//                   context,
//                   text: "Tiếp tục",
//                 ),
//                 onPressed: () async {},
//               ),
//             ),
//             SizedBoxConst.size(context: context, size: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextConstant.subTile3(context, text: 'Đã nhận được mã OTP? '),
//                 TextButton(
//                   onPressed: () async {},
//                   child: TextConstant.subTile3(
//                     context,
//                     text: 'Gửi lại',
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
