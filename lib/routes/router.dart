import 'package:go_router/go_router.dart';
import 'package:trivia/screens/error_screen.dart';
import 'package:trivia/screens/home.dart';
import 'package:trivia/screens/questions.dart';
import 'package:trivia/screens/reviews.dart';
import 'package:trivia/screens/settings.dart';

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
      routes: [
        GoRoute(
          path: '/questions',
          builder: (context, state) => const Questions(),
        ),
        GoRoute(
          path: '/reviews',
          builder: (context, state) => const Reviews(),
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Settings(),
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
  debugLogDiagnostics: true,
);
