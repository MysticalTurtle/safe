import 'package:safe/domain/entities/reward.dart';

abstract class RewardRepository {
  Future<List<Reward>> listReward({
    required int idUser,
  });
}

class RewardRepositoryImpl extends RewardRepository {
  @override
  Future<List<Reward>> listReward({
    required int idUser,
  }) async {
    List<Reward> rewards = [];

    dynamic jsonData;
    jsonData = {
      "data": [
        {
          "id": 1,
          "description":
              "El condicional if es muy utilizado, y nos permite evaluar si una condición se cumple. Si la condición se cumple, podemos asignarle una instrucción",
          "image": "Description 1",
          "level": 1,
          "name": "IF",
          "color": "0xFFA1D2F7"
        },
        {
          "id": 2,
          "description":
              "El condicional if else, le agrega al condicional if la posibilidad de ejecutar una instrucción en caso no se esté cumpliendo su condición.",
          "image": "Description 2",
          "level": 2,
          "name": "IF ELSE",
          "color": "0xFF89A5DC"
        },
        {
          "id": 3,
          "description":
              "El condicional switch nos permite encontrar un caso entre varios existentes, para el caso que coincida entre esos existentes, podemos asignarle una instrucción específica.",
          "image": "Description 1",
          "level": 3,
          "name": "SWITCH",
          "color": "0xFFA1F7D3"
        },
        {
          "id": 4,
          "description":
              "El ciclo for nos permite hacer recorridos o 'dar pasos' desde un 'inicio' a un 'fin', además podemos indicarle cada cuántos 'saltos' dar durante su recorrido.",
          "image": "Description 1",
          "level": 4,
          "name": "FOR",
          "color": "0xFFE5E5E5"
        },
        {
          "id": 5,
          "description":
              "El ciclo while nos permite ejecutar una instrucción mientras se esté cumpliendo alguna condición.",
          "image": "Description 1",
          "level": 5,
          "name": "WHILE",
          "color": "0xFFA1D2F7"
        },
        {
          "id": 6,
          "description":
              "A diferencia del while, do while ejecuta al menos una vez una instrucción, se esté cumpliendo o no alguna condición.",
          "image": "Description 1",
          "level": 6,
          "name": "DO WHILE",
          "color": "0xFFA1D2F7"
        }
      ]
    };

    jsonData["data"].forEach((element) {
      rewards.add(Reward.fromMap(element));
    });

    return rewards;
  }
}
