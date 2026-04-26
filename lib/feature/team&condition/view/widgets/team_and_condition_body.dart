import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/const/color_app.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/core/widget/custom_text.dart';
import 'package:fruits_app/feature/team&condition/view_model/condition/cubit/condition_cubit.dart';
import 'package:go_router/go_router.dart';

class TeamAndConditionBody extends StatefulWidget {
  const TeamAndConditionBody({super.key});

  @override
  State<TeamAndConditionBody> createState() => _TeamAndConditionBodyState();
}

class _TeamAndConditionBodyState extends State<TeamAndConditionBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ConditionCubit>().condition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    final orientation =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            CustomAppBar(
              title: "termsTitle".tr(),
              centerTitle: true,
              onTap: () => context.go('/nav', extra: 4),
              backIcon: true,
            ),
            SizedBox(height: h * 0.02),
            BlocBuilder<ConditionCubit, ConditionState>(
              builder: (context, state) {
                if (state is ConditionLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ConditionSuccess) {
                  var d = state.data;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: h * 0.02),
                    child: CustomText(
                      fontSize: orientation ? h * 0.017 : h * 0.04,
                      color: ColorApp.black,
                      title: "${d.data!.details}",
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
