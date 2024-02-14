import 'package:learn_bloc/data/models/characters_model.dart';
import 'package:learn_bloc/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getCharacters() async {
    try {
      final characters = await charactersWebServices.getCharacters();
      return characters
          .map((character) =>
              Character.fromJson(character as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
