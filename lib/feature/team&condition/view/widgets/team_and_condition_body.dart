import 'package:flutter/material.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:go_router/go_router.dart';

class TeamAndConditionBody extends StatelessWidget {
  const TeamAndConditionBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          SizedBox(height: h * 0.06),
          CustomAppBar(title: "Terms and Conditions", centerTitle: true,onTap: ()=>context.go('/nav'),),
SizedBox(height: h * 0.02),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: h*0.02),
            child: CustomText(
              fontSize: h * 0.017,
              color: ColorApp.black,
              title:
                  ''' A Terms and Conditions agreement acts as 
a legal contractbetween you (the company)
and the user. 
It’s where you 
maintain your rights to exclude users from 
your app in the event that they abuse your 
website/app, set out the rules for 
using your service and note other important 
details and disclaimers. 

Having a Terms and Conditions agreement is 
completely optional. No laws require you to 
have one. Not even the super-strict and 
wide-reaching General Data Protection 
Regulation (GDPR).

Your Terms and Conditions agreement will 
be uniquely yours. While some clauses are 
standard and commonly seen in pretty much 
every Terms and Conditions agreement, it’s 
up to you to set the rules and guidelines that
the user must agree to.

Terms and Conditions agreements are also
known as Terms of Service or Terms of Use 
agreements. These terms are 
interchangeable, practically speaking. 
More rarely, it may be called something like 
an End User Services Agreement (EUSA). ''',
            ),
          ),
        ],
      ),
    );
  }
}
