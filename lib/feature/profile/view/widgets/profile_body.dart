import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_phone_text_field.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:fruits_app/feature/profile/view_model/profile/cubit/get_profile_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String name = "";
  @override
  void initState() {
    // TODO: implement initState
    context.read<GetProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: h * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: orientation ? h * 0.1 : h * 0.05),
              GestureDetector(
                onTap: () {
                  context.go('/nav', extra: 4);
                },
                child: Icon(Icons.arrow_back_ios, size: h * 0.03),
              ),
              SizedBox(height: h * 0.06),
              Center(
                child: Stack(
                  children: [
                    BlocBuilder<GetProfileCubit, GetProfileState>(
                      builder: (context, state) {
                        if (state is GetProfileLoading) {
                          return Skeletonizer(
                            effect: ShimmerEffect(
                              baseColor: Colors.grey.shade300, // اللون الأساسي
                              highlightColor:
                                  Colors.grey.shade100, // لون اللمعة
                            ),
                            enabled: true,
                            child: Container(
                              height: h * 0.1,
                              width: h * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is GetProfileSuccess) {
                          var data = state.data.data;
                          
                          
                          return Column(
                            children: [
                              Container(
                                height: h * 0.1,
                                width: h * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.green, width: 2),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusGeometry.circular(50),
                                  child: Image.asset("assets/image/animal.png")),
                              ),
                                SizedBox(height: h * 0.03),
                              Center(
                                child: CustomText(
                                  fontSize: h * 0.03,
                                  color: Colors.black,
                                  title: "welcome ${data.name} ",
                                  fontFamily: false,
                                ),
                              ),
                            ],
                          );
                        }
                        if (state is GetProfileFailure) {
                          log(state.massage);
                        }
                        return Container();
                      },
                    ),
                    Positioned(
                      left: h * 0.063,
                      top: h * 0.065,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: h * 0.04,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            
              SizedBox(height: h * 0.03),
              BlocBuilder<GetProfileCubit, GetProfileState>(
                builder: (context, state) {
                  if (state is GetProfileLoading) {
                    return Column(
                      children: [
                        Skeletonizer(
                          effect: ShimmerEffect(
                            baseColor: Colors.grey.shade300, // اللون الأساسي
                            highlightColor: Colors.grey.shade100, // لون اللمعة
                          ),
                          enabled: true,
                          child: CustomTextFormField(
                            fontSize: h * 0.02,
                            helper: "",
                            hint: "",
                            controller: nameController,
                            h: h,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        Skeletonizer(
                          effect: ShimmerEffect(
                            baseColor: Colors.grey.shade300, // اللون الأساسي
                            highlightColor: Colors.grey.shade100, // لون اللمعة
                          ),
                          enabled: true,
                          child: CustomTextFormField(
                            fontSize: h * 0.02,
                            helper: "",
                            hint: "",
                            controller: nameController,
                            h: h,
                          ),
                        ),
                        SizedBox(height: h * 0.01),
                        Skeletonizer(
                          effect: ShimmerEffect(
                            baseColor: Colors.grey.shade300, // اللون الأساسي
                            highlightColor: Colors.grey.shade100, // لون اللمعة
                          ),
                          enabled: true,
                          child: CustomTextFormField(
                            fontSize: h * 0.02,
                            helper: "",
                            hint: "",
                            controller: nameController,
                            h: h,
                          ),
                        ),
                      ],
                    );
                  }
                  if (state is GetProfileSuccess) {
                    var data = state.data.data;

                    nameController.text = data.name!;
                    phoneController.text = data.mobile!;

                    return Column(
                      children: [
                        CustomTextFormField(
                          fontSize: h * 0.02,
                          helper: "fullName".tr(),
                          hint: "fullNameHint".tr(),
                          controller: nameController,
                          h: h,
                        ),
                        SizedBox(height: h * 0.01),
                        CustomPhoneTextField(
                          helper: "phoneNumber".tr(),
                          controller: phoneController,
                          validator: (value) {
                            return "enterNumber".tr();
                          },
                        ),
                        SizedBox(height: h * 0.01),
                        CustomTextFormField(
                          fontSize: h * 0.02,
                          helper: "password".tr(),
                          hint: "passwordHint".tr(),
                          controller: passwordController,
                          h: h,
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
              SizedBox(height: h * 0.03),
              CustomBottom(
                width: double.infinity,
                title: "update".tr(),
                heightBottom: h * 0.06,
                heightText: h * 0.02,
                colorBottom: ColorApp.green,
                colorText: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
