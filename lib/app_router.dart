import "package:flutter/material.dart";
import 'package:learn_bloc/presentation/screens/home_screen.dart';
import "package:learn_bloc/constants/strings.dart";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
