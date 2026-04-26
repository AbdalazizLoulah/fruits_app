import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/widget/custom_app_bar.dart';
import 'package:fruits_app/feature/about_us/view_model/about_us/cubit/about_us_cubit.dart';
import 'package:go_router/go_router.dart';

class AboutBody extends StatefulWidget {
  const AboutBody({super.key});

  @override
  State<AboutBody> createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {
  @override
  void initState() {
    context.read<AboutUsCubit>().about();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          CustomAppBar(title: "About Us", centerTitle: true,backIcon: true,onTap: () => context.go('/nav', extra: 4),),
          Padding(
            padding: EdgeInsets.all(h * 0.02),
            child: BlocBuilder<AboutUsCubit, AboutUsState>(
              builder: (context, state) {
                if (state is AboutUsLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is AboutUsSuccess) {
                  var data = state.data;
                  return Container(
                    child: Text(
                      style: TextStyle(fontSize: h * 0.02),
                      "${data.data!.detailsEn}"
                      ),
                  );
                }
                if (state is AboutUsFailure) {
                  return Container(
                    child: Text(
                      style: TextStyle(fontSize: h * 0.02),
                      "${state.massage}",
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
