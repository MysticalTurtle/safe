import 'package:flutter/cupertino.dart';
import 'package:safe/data/user_repository.dart';
import 'package:safe/domain/entities/reward.dart';

class RewardProvider extends ChangeNotifier {
  int _nivel = 2;
  int get nivel => _nivel;

  static Future<List<Reward>> getRewards({idUser = 0}) async {
    List<Reward> reward =
        await RewardRepositoryImpl().listReward(idUser: idUser);
    return reward;
  }

  void incrementNivel() {
    _nivel++;
    notifyListeners();
  }
}
