import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/quiz.dart';
import 'package:getx_example/screens/home_screen.dart';
import 'package:getx_example/screens/widgets/global_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/utils/colors/app_colors.dart';
import '../utils/utils/styles/app_text_style.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<int> listAvg = [];
  int tempAvg = 0;

  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: AppColors.c_273032,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 7.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.w),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.c_2F3739),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            blurRadius: 12,
                            color: Colors.black.withOpacity(.25),
                            offset: const Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.c_162023,
                    ),
                    child: Row(
                      children: [
                        CircularPercentIndicator(
                          circularStrokeCap: CircularStrokeCap.round,
                          startAngle: 0,
                          radius: 50.r,
                          lineWidth: 8.h,
                          percent: controller.correct.length /
                              controller.answers.length,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text:
                                          controller.correct.length.toString(),
                                      style: AppTextStyle.interSemiBold
                                          .copyWith(
                                              color: AppColors.cF2F2F2,
                                              fontSize: 20.sp),
                                      children: [
                                    TextSpan(
                                        text: '/${controller.answers.length}',
                                        style: AppTextStyle.interRegular
                                            .copyWith(
                                                color: AppColors.cF2F2F2
                                                    .withOpacity(0.75),
                                                fontSize: 15.sp))
                                  ])),
                              Text(
                                'natijangiz',
                                style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.cF2F2F2.withOpacity(0.75),
                                    fontSize: 12.sp),
                              )
                            ],
                          ),
                          animation: true,
                          animationDuration: 1000,
                          progressColor: AppColors.c2954D,
                          backgroundColor: AppColors.c2954D.withOpacity(0.2),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: "Tabriklaymiz! Siz",
                              style: AppTextStyle.interMedium.copyWith(
                                  color: AppColors.cF2F2F2, fontSize: 16.sp),
                              children: [
                                TextSpan(
                                  text: " bu testda",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 16.sp),
                                ),
                                TextSpan(
                                    text:
                                        " ${(controller.correct.length / controller.answers.length * 100).round()}%",
                                    style: AppTextStyle.interBold.copyWith(
                                        color: AppColors.c2954D,
                                        fontSize: 16.sp)),
                                TextSpan(
                                  text: " bilan ",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 16.sp),
                                ),
                                TextSpan(
                                    text: "o'tdingiz!",
                                    style: AppTextStyle.interBold.copyWith(
                                        color: AppColors.c_6FCF97,
                                        fontSize: 16.sp)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: AppColors.c_27AE60,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.correct.length.toString(),
                                  style: AppTextStyle.interSemiBold.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  "To'g'ri javoblar",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 13.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 8.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: AppColors.cEB5757,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (controller.answers.length -
                                          controller.correct.length)
                                      .toString(),
                                  style: AppTextStyle.interSemiBold.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 20.sp),
                                ),
                                Text(
                                  "Noto'g'ri javoblar",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 13.sp),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 8.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: AppColors.c2954D,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.timeString.value,
                                  style: AppTextStyle.interSemiBold.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 16.sp),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Umumiy Vaqt",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 12.7.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 8.w),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 12.h),
                            decoration: BoxDecoration(
                                color: AppColors.c_0E81B4,
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${(int.parse(controller.timeString.value.split(" ")[1]) * 60 - controller.seconds.value) ~/ 60}minut ${(int.parse(controller.timeString.value.split(" ")[1]) * 60 - controller.seconds.value) % 60}",
                                  style: AppTextStyle.interSemiBold.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 16.sp),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Ketgan vaqt",
                                  style: AppTextStyle.interMedium.copyWith(
                                      color: AppColors.cF2F2F2,
                                      fontSize: 12.7.sp),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: Ink(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: AppColors.c2954D),
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.c2954D.withOpacity(.5)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            child: Center(
                              child: Text(
                                "Javoblarni Tekshirish",
                                style: AppTextStyle.interSemiBold.copyWith(
                                    color: AppColors.cF2F2F2, fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: SizedBox(
                      width: double.infinity,
                      child: Ink(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: AppColors.c2954D),
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.c2954D),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap: () {
                            controller.timerStart(
                                minute: int.parse(
                                    controller.timeString.split(" ")[1]));
                            Get.off(() => HomeScreen());
                          },
                          child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.refresh,
                                    color: AppColors.cF2F2F2,
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Text(
                                    "Qayta Boshlash",
                                    style: AppTextStyle.interSemiBold.copyWith(
                                        color: AppColors.cF2F2F2,
                                        fontSize: 16.sp),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.h, left: 5.w, right: 5.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: AppColors.c_162023),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qayta Tes:",
                      style: AppTextStyle.interSemiBold
                          .copyWith(color: AppColors.cF2F2F2, fontSize: 15.sp),
                    ),
                    Text(
                      "Savollar",
                      style: AppTextStyle.interRegular
                          .copyWith(color: AppColors.cF2F2F2, fontSize: 15.sp),
                    )
                  ],
                ),
                Material(
                  borderRadius: BorderRadius.circular(16.r),
                  child: GlobalButton(
                    subtitle: Text("Go",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.cF2F2F2)),
                    onTap: () {
                      controller.timerStart(
                          minute:
                              int.parse(controller.timeString.split(" ")[1]));
                      Get.off(() => HomeScreen());
                    },
                    horizontalPadding: 21,
                    verticalPadding: 12,
                    backgroundColor: AppColors.c2954D,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
