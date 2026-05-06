// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/service/api_service.dart';
import 'package:fruits_app/feature/about_us/view/about_Screen.dart';
import 'package:fruits_app/feature/basket/view/widgets/basket_body.dart';
import 'package:fruits_app/feature/details_seller/data/models/product_model.dart';
import 'package:fruits_app/feature/home/data/model/vendor_model.dart';
import 'package:fruits_app/feature/product_details/view_model/get_product_sells/cubit/get_product_sells_cubit.dart';
import 'package:fruits_app/feature/home/view_model/sellers/cubit/get_seller_cubit.dart';
import 'package:fruits_app/feature/nav_bar/view/widgets/custom_bottom_nav.dart';
import 'package:go_router/go_router.dart';


import 'package:fruits_app/feature/Auth/forgetPassword/view/forget_password.dart';
import 'package:fruits_app/feature/Auth/logIn/view/log_in_screen.dart';
import 'package:fruits_app/feature/Auth/otp/view/otp_screen.dart';
import 'package:fruits_app/feature/Auth/signUp/view/sign_in_screen.dart';
import 'package:fruits_app/feature/checkout/view/check_out_screen.dart';
import 'package:fruits_app/feature/contact_us/view/contact_us_screen.dart';
import 'package:fruits_app/feature/details_seller/view/details_seller_screen.dart';
import 'package:fruits_app/feature/error_screen/view/check_out_error.dart';
import 'package:fruits_app/feature/home/view/home_screen.dart';
import 'package:fruits_app/feature/on_board.dart/view/on_board_screen.dart';
import 'package:fruits_app/feature/order_tracking/view/order_tracking_screen.dart';
import 'package:fruits_app/feature/product_details/view/product_details_screen.dart';
import 'package:fruits_app/feature/profile/view/profile_screen.dart';
import 'package:fruits_app/feature/splash/view/splash_screen.dart';
import 'package:fruits_app/feature/success_screen/view/check_out_success.dart';
import 'package:fruits_app/feature/team&condition/view/team_and_condition_screen.dart';
import 'package:fruits_app/feature/welcome/view/welcome_screen.dart';

class AppRouter {
  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/onboard', builder: (context, state) => OnBoardScreen()),
      GoRoute(path: '/welcome', builder: (context, state) => WelcomeScreen()),
      GoRoute(path: '/logIn', builder: (context, state) => LogInScreen()),
      GoRoute(
        path: '/forgetPassword',
        builder: (context, state) => ForgetPassword(),
      ),
      GoRoute(path: '/signUp', builder: (context, state) => SignInScreen()),
      GoRoute(path: '/otp', builder: (context, state) => OtpScreen()),
      GoRoute(
        path: '/nav',
        builder: (context, state) {
          final index = state.extra as int? ?? 0;
          return BlocProvider(
            create: (context) =>
                GetSellerCubit(ApiService(dio: Dio()))..getSellers(),
            child: CustomBottomNav(currentIndex: index),
          );
        },
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => BlocProvider(
          create: (context) =>
              GetSellerCubit(ApiService(dio: Dio()))..getSellers(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/detailsSeller',
        builder: (context, state) {
          final index = state.extra as VendorModel;
          return BlocProvider(
            create: (context) =>
                GetProductSellsCubit(ApiService(dio: Dio()))
                  ..getProduct(id: index.id),
            child: DetailsSellerScreen(id: index),
          );
        },
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) {
          final data = state.extra as ProductModel;
          return ProductDetailsScreen(data: data);
        },
      ),
      GoRoute(
        path: '/team',
        builder: (context, state) => TeamAndConditionScreen(),
      ),
      GoRoute(path: '/contact', builder: (context, state) => ContactUsScreen()),
      GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
      GoRoute(
        path: '/orderTracking',
        builder: (context, state) => OrderTrackingScreen(),
      ),
      GoRoute(
        path: '/chickOut',
        builder: (context, state) {
          final data = state.extra as CheckOut;
          return CheckOutScreen(data: data,);
        },
      ),
      GoRoute(
        path: '/chickOutSuccess',
        builder: (context, state) => CheckOutSuccess(),
      ),
      GoRoute(
        path: '/chickOutError',
        builder: (context, state) => CheckOutError(),
      ),
      GoRoute(path: '/aboutUs', builder: (context, state) => AboutScreen()),
    ],
  );
}
