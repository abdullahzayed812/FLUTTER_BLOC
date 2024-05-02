import 'package:dio/dio.dart';
import 'package:learn_bloc/constants/strings.dart';
import 'package:learn_bloc/data/models/characters_model.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<Character>> getCharacters() async {
    try {
      Response response = await dio.get(users);

      return (response.data as List<dynamic>)
          .map((character) => Character.fromJson(character))
          .toList();
    } catch (e) {
      print(e);
    }
    return [];
  }
}
