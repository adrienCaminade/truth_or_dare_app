import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:true_or_dare_app/models/Game.dart';


class API {
  static const _dareSpicyUrl = 'https://truthordareapi.creativedev.fr/api/dareSpicy';
  static const _truthSpicyUrl = 'https://truthordareapi.creativedev.fr/api/truthSpicy';

  static const _dareClassicUrl = 'https://truthordareapi.creativedev.fr/api/dareClassic';
  static const _truthClassicUrl = 'https://truthordareapi.creativedev.fr/api/truthClassic';


  Future<List<Game>> getDareSpicy() async {
    final response = await http.get(
      Uri.parse(_dareSpicyUrl),
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((item) => Game.fromJson(item)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Game>> getTruthSpicy() async {
    final response = await http.get(
      Uri.parse(_truthSpicyUrl),
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((item) => Game.fromJson(item)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Game>> getDareClassic() async {
    final response = await http.get(
      Uri.parse(_dareClassicUrl),
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((item) => Game.fromJson(item)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Game>> getTruthClassic() async {
    final response = await http.get(
      Uri.parse(_truthClassicUrl),
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body) as List;
      return decodedData.map((item) => Game.fromJson(item)).toList();
    } else {
      throw Exception('Something happened');
    }
  }




}
