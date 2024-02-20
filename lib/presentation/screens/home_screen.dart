import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:learn_bloc/business_logic/cubit/characters_cubit.dart";
import "package:learn_bloc/constants/colors.dart";
import "package:learn_bloc/data/models/characters_model.dart";
import "package:learn_bloc/presentation/widgets/character_item.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Character> characters;

  @override
  void initState() {
    characters = BlocProvider.of<CharactersCubit>(context).getCharacters();

    super.initState();
  }

  Widget _buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        characters = state.characters;

        // print(characters);

        return _buildListWidgets();
      } else {
        return _showLoading();
      }
    });
  }

  Widget _buildListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.gray,
        child: _buildCharactersList(),
      ),
    );
  }

  Widget _showLoading() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.orange,
      ),
    );
  }

  Widget _buildCharactersList() {
    return GridView.builder(
      itemCount: characters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) => const CharacterItem(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        title:
            const Text("Home Screen", style: TextStyle(color: AppColors.gray)),
      ),
      body: _buildBlocWidget(),
    );
  }
}
