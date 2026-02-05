import 'package:fruits_app/feature/Auth/forgetPassword/view/forget_password.dart';
import 'package:fruits_app/feature/Auth/logIn/view/log_in_screen.dart';
import 'package:fruits_app/feature/Auth/otp/view/otp_screen.dart';

import 'package:fruits_app/feature/Auth/signUp/view/sign_in_screen.dart';
import 'package:fruits_app/feature/details_seller/view/details_seller_screen.dart';
import 'package:fruits_app/feature/home/view/home_screen.dart';

import 'package:fruits_app/feature/nav_bar/view/navigate_screen.dart';
import 'package:fruits_app/feature/on_board.dart/view/on_board_screen.dart';
import 'package:fruits_app/feature/product_details/view/product_details_screen.dart';
import 'package:fruits_app/feature/splash/view/splash_screen.dart';
import 'package:fruits_app/feature/welcome/view/welcome_screen.dart';
import 'package:go_router/go_router.dart';

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
      GoRoute(
        path: '/signUp',
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(path: '/otp', builder: (context, state) => OtpScreen()),
      GoRoute(path: '/nav', builder: (context, state) => NavigateScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/detailsSeller', builder: (context, state) => DetailsSellerScreen()),
      GoRoute(
        path: '/product',
        builder: (context, state) => ProductDetailsScreen(),
      ),
    ],
  );
}
