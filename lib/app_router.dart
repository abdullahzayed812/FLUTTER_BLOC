import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:learn_bloc/business_logic/cubit/characters_cubit.dart";
import "package:learn_bloc/data/repositories/characters_repository.dart";
import "package:learn_bloc/data/web_services/characters_web_services.dart";
import 'package:learn_bloc/presentation/screens/home_screen.dart';
import "package:learn_bloc/constants/strings.dart";

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const HomePage(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
