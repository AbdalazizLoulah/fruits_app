
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_bottom.dart';
import 'package:fruits_app/core/widget/custom_text_form_field.dart';
import 'package:fruits_app/feature/contact_us/view/widgets/custom_social.dart';
import 'package:fruits_app/feature/contact_us/view_model/cubit/contact_us_cubit.dart';
import 'package:go_router/go_router.dart';

class ContactUsBody extends StatefulWidget {
  const ContactUsBody({super.key});

  @override
  State<ContactUsBody> createState() => _ContactUsBodyState();
}

class _ContactUsBodyState extends State<ContactUsBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Form(
      key: key,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: "Contact Us",
                centerTitle: true,
                onTap: () => context.go('/nav', extra: 4),
                backIcon: true,
              ),
              SizedBox(height: h * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: h * 0.03),
                child: Column(
                  children: [
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your name";
                        }
                        if (value.length < 5) {
                          return "name is short";
                        }
                        return null;
                      },
                      h: h,
                      fontSize: h * 0.015,
                      helper: "Name",
                      hint: "",
                      controller: nameController,
                    ),
                    SizedBox(height: h * 0.02),
                    CustomTextFormField(
                      type: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your mobile";
                        }
                        if (value.length < 11) {
                          return "name is short";
                        }
                        return null;
                      },
                      h: h,
                      fontSize: h * 0.015,
                      helper: "Mobile",
                      hint: "",
                      controller: mobileController,
                    ),
                    SizedBox(height: h * 0.02),
                    CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your massage";
                        }
                        return null;
                      },
                      maxLine: 5,
                      h: h,
                      fontSize: h * 0.015,
                      helper: "message",
                      hint: "",
                      controller: messageController,
                    ),
                    SizedBox(height: h * 0.04),
                    BlocConsumer<ContactUsCubit, ContactUsState>(
                      listener: (context, state) {
                        if (state is ContactUsFailure) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Error"),
                              icon: Icon(Icons.error),
                              content: Container(
                                height: h * 0.05,
                                width: h * 0.05,
                                child: Column(
                                  children: [
                                    Text(
                                      state.massage,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        if (state is ContactUsSuccess) {
                          var d = state.data;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              onVisible: () {
                                if (d.result == false) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Error"),
                                      icon: Icon(Icons.error),
                                      content: Container(
                                        height: h * 0.07,
                                        width: h * 0.05,
                                        child: Column(
                                          children: [
                                            Text(
                                              d.errorMessage.toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              },
                              content: Text("${d.errorMessage}"),
                              backgroundColor: d.result == true
                                  ? Colors.green
                                  : Colors.red,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is ContactUsLoading) {
                          return Container(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return CustomBottom(
                          onTap: () {
                            if (key.currentState!.validate()) {
                              context.read<ContactUsCubit>().sendMassage(
                                name: nameController.text,
                                massage: messageController.text,
                                mobile: mobileController.text,
                              );
                            }
                          },
                          width: w,
                          title: "Submit",
                          heightBottom: h * 0.06,
                          heightText: h * 0.02,
                          colorBottom: ColorApp.green,
                          colorText: Colors.white,
                        );
                      },
                    ),
                    SizedBox(height: h * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSocial(
                          h: h,
                          w: w,
                          icon: FontAwesomeIcons.whatsapp,
                          colorIcon: Colors.green,
                        ),
                        CustomSocial(
                          h: h,
                          w: w,
                          icon: FontAwesomeIcons.facebook,
                          colorIcon: Colors.lightBlue,
                        ),
                        CustomSocial(
                          h: h,
                          w: w,
                          icon: FontAwesomeIcons.instagram,
                          colorIcon: Colors.red,
                        ),
                        CustomSocial(
                          h: h,
                          w: w,
                          icon: FontAwesomeIcons.youtube,
                          colorIcon: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
