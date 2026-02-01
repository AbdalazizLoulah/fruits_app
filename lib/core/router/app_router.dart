import 'package:fruits_app/feature/on_board.dart/view/on_boarde_screen.dart';
import 'package:fruits_app/feature/splash/view/splash_screen.dart';
import 'package:fruits_app/feature/welcom/view/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final route = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplashScreen()),
      GoRoute(path: '/onboard', builder: (context, state) => OnBoardScreen()),
      GoRoute(path: '/welcome', builder: (context, state) => WelcomeScreen()),
    ],
  );
}
