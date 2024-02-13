import "package:flutter/material.dart";
import "package:learn_bloc/presentation/screens/home.dart";

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
