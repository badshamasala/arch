import 'package:arch/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  // final controller = Get.find<TermsConditionController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackBar(title: "Terms & Condition", showBackButton: true),
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                "assets/terms_back.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ],
          ),
          Positioned(
            top: 110.h, // Adjust this value to control overlap
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColorConst.secondaryLight.withValues(),
                ),
                gradient: LinearGradient(
                  colors: [
                    AppColorConst.gradient1,
                    AppColorConst.secondaryLight,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.sp),
                  topRight: Radius.circular(25.sp),
                ),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: termsAndCondition.length,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${termsAndCondition[index]["title"]}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColorConst.primary,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "${termsAndCondition[index]["desc"]}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColorConst.primaryDark,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> termsAndCondition = [
    {
      "title": "1. Acceptance of Terms",
      "desc":
          'These Terms of Service ("Terms") constitute a legally binding agreement between you ("User") and ARchitect Vision, LLC ("Company," "we," "us," or "our") regarding your use of our website and services. By accessing our site, creating an account, or using any features, you accept and agree to these Terms.',
    },
    {
      "title": "2. Eligibility",
      "desc":
          'Be at least 18 years old or have parental/guardian consent. Provide accurate and truthful information during registration.Comply with all applicable laws and regulations.',
    },
    {"title": "3. Use of Our Services", "desc": ""},

    {
      "title": "A. Permitted Use",
      "desc":
          "You may use our website and services for personal and non-commercial purposes only, unless explicitly authorized by us.",
    },
    {
      "title": "B. Prohibited Use",
      "desc":
          "Use the platform for any unlawful or harmful activities.Reverse-engineer, modify, or distribute our software or content without permission.Use automated systems (e.g., bots) to access our services.",
    },
    {
      "title": "4. User Content",
      "desc":
          "You may upload, submit, or share content through our platform. By doing so, you grant AR|chitect a non-exclusive, worldwide, royalty-free license to use, reproduce, and display your content for the purpose of operating and promoting the platform.",
    },
    {"title": "5. Payments and Subscriptions", "desc": ""},
    {
      "title": "A. Subscription Tiers",
      "desc":
          "AR|chitect offers various subscription plans. By subscribing, you agree to pay the fees associated with your chosen plan.",
    },
    {
      "title": "B. Payment Terms",
      "desc":
          "All payments are non-refundable unless otherwise specified.Subscriptions automatically renew unless canceled prior to the renewal date.",
    },
    {
      "title": "C. Cancellation",
      "desc":
          "You may cancel your subscription at any time through your account settings. Access to premium features will remain available until the end of your billing cycle.",
    },
    {
      "title": "6. Intellectual Property",
      "desc":
          "All content, trademarks, and materials on the AR|chitect platform are owned by us or licensed to us. You may not use, reproduce, or distribute our intellectual property without our written consent.",
    },
    {
      "title": "7. Privacy",
      "desc":
          "Your use of our services is subject to our Privacy Policy. By using our platform, you consent to our data collection, usage, and storage practices as outlined in the policy.",
    },
    {
      "title": "8. Limitation of Liability",
      "desc":
          "Any indirect, incidental, or consequential damages arising from your use of the platform. Errors or inaccuracies in our services.Any unauthorized access to your account.",
    },
    {
      "title": "9. Termination",
      "desc":
          "We reserve the right to terminate or suspend your account at our discretion, without notice, if we believe you have violated these Terms or engaged in harmful activities.",
    },
    {
      "title": "10. Third-Party Links",
      "desc":
          "Our website may contain links to third-party websites. AR|chitect is not responsible for the content, privacy practices, or terms of these external sites. You use them at your own risk.",
    },
    {
      "title": "11. Dispute Resolution",
      "desc":
          "Any disputes, claims, or controversies arising out of or relating to these Terms, the breach thereof, or your use of AR|chitect's services shall be resolved exclusively through binding arbitration. Arbitration shall be conducted in accordance with the rules of the American Arbitration Association (AAA) or another mutually agreed-upon arbitration organization. The arbitration shall take place in Loudoun County, Virginia, or another location mutually agreed upon by both parties, and the proceedings shall be confidential. If an in-person hearing is not practical or preferred by either party, the arbitration may be conducted remotely via video conferencing or another agreed-upon method.",
    },
  ];
}

// import 'package:architect/config/navigation/app_route.dart';
// import 'package:architect/core/constants/app_colors.dart';
// import 'package:architect/core/constants/image_const.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

class CustomBackBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showNotification;
  final bool showTrailingButton;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onBackTap;
  final VoidCallback? onTrailingTap;
  // final String? notificationIcon;

  const CustomBackBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showNotification = false,
    this.showTrailingButton = false,
    this.onNotificationTap,
    this.onBackTap,
    this.onTrailingTap,
    // this.notificationIcon = ImageConst.notification,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColorConst.scaffoldBackgroundColor,
          boxShadow: [],
        ),
        child: Row(
          children: [
            ///  Back Button
            if (showBackButton)
              GestureDetector(
                // onTap: onBackTap ?? () => Get.back(),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColorConst.primary,
                  size: 32.h,
                ),
              ),

            ///  Spacer
            const Spacer(),

            ///  Center Logo
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColorConst.primary,
                fontWeight: FontWeight.w700,
              ),
            ),

            /// Spacer
            const Spacer(),

            /// Notification Icon
            // if (showNotification)
            //   GestureDetector(
            //     onTap:
            //         onNotificationTap ??
            //         () => Get.toNamed(AppRoutes.notificationHistory),
            //     child: SvgPicture.asset(
            //       notificationIcon!,
            //       height: 24.h,
            //       width: 22.w,
            //     ),
            //   ),
            // if (showTrailingButton)
            //   TextButton(
            //     style: TextButton.styleFrom(
            //       minimumSize: Size(80.w, 25.h),
            //       padding: EdgeInsets.zero,
            //       backgroundColor: AppColorConst.primary,
            //       foregroundColor: AppColorConst.white,
            //     ),
            //     // onPressed: onTrailingTap ?? () => Get.back(),
            //     child: Text("Edit"),
            //   ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}


// echo "# arch" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/badshamasala/arch.git
// git push -u origin main