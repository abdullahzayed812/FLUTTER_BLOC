import "package:flutter_bloc/flutter_bloc.dart";
import "package:learn_bloc/data/models/characters_model.dart";
import "package:learn_bloc/data/repositories/characters_repository.dart";

part "characters_state.dart";

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  // late List<Character> characters;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getCharacters() {
    charactersRepository.getCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      return characters;
    });
    return [];
    // return characters;
  }
}
