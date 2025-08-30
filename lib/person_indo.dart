import 'package:arch/colors.dart';
import 'package:arch/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColorConst.scaffoldBackgroundColor,
      appBar: CustomBackBar(
        title: 'Personal Info',
        showBackButton: true,
        showTrailingButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfilePicture(),
            SizedBox(height: 100.h),
            // GetBuilder<PersonalInfoController>(
            //   builder: (controller) {
            //     return !cntr.isEdit ? buildNamePlate() : buildEditableNamePlate();
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget buildProfilePicture() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('Profile picture tapped');
        buildModalSheet();
      },
      child: Container(
        // color: Colors.transparent,
        alignment: Alignment.topCenter,
        height: 165.h,
        child: Stack(
          alignment: Alignment.bottomCenter, // use concrete Alignment
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: EdgeInsets.all(20.r),
              width: double.infinity,
              height: 115.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColorConst.secondaryLight),
                color: AppColorConst.secondaryLight,
                borderRadius: BorderRadius.circular(16.r),
                image: DecorationImage(
                  image: const AssetImage("assets/terms_back.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // make the positioned child span full width and center its content
            Positioned(
              top: 55.h,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundColor: AppColorConst.white,
                      child: CircleAvatar(
                        radius: 55.r,
                        backgroundColor: AppColorConst.primary,
                        child: Icon(
                          Icons.person,
                          color: AppColorConst.white,
                          size: 90.sp,
                        ),
                      ),
                    ),
                    // Larger tappable area for edit icon
                    Padding(
                      padding: EdgeInsets.all(6.r),
                      child: CircleAvatar(
                        radius: 12.r,
                        backgroundColor: AppColorConst.white,
                        child: CircleAvatar(
                          backgroundColor: AppColorConst.primary,
                          radius: 10.r,
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableTitle({
    required String title,
    required TextEditingController controller,
    required bool isEnabled,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: AppColorConst.primary,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          decoration: BoxDecoration(
            color: AppColorConst.secondaryLight,
            borderRadius: BorderRadius.circular(40.sp),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF543733).withValues(alpha: 0.5),
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            enabled: isEnabled,

            // maxLines: 5,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 23,
                vertical: 12.h,
              ),
              hintText: 'Enter Your Text',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.5,
                color: AppColorConst.primaryDark,
              ),
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9\s\-_.(),!?\x27\x22:\n\r]'),
              ),
            ],
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.5,
              color: AppColorConst.primaryDark,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitle({required String title, desc}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColorConst.black,
          ),
        ),
        SizedBox(width: 10.w),
        Text(
          desc,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColorConst.primaryDark,
          ),
        ),
      ],
    );
  }

  buildModalSheet() {
    debugPrint('buildModalSheet called');
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColorConst.secondaryLight,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8.h),
                  Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Choose an option",
                    style: TextStyle(
                      color: AppColorConst.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColorConst.white,
                            ),
                            child: Icon(Icons.camera_alt, size: 20.sp),
                          ),
                          SizedBox(height: 8.h),
                          Text("Camera"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColorConst.white,
                            ),
                            child: Icon(Icons.photo_library, size: 20.sp),
                          ),
                          SizedBox(height: 8.h),
                          Text("Gallery"),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColorConst.white,
                            ),
                            child: Icon(Icons.delete, size: 20.sp),
                          ),
                          SizedBox(height: 8.h),
                          Text("Delete"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
