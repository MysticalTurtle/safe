import 'package:flutter/widgets.dart';
import 'package:safe/presentation/home/challenges/challenges_page.dart';
import 'package:safe/presentation/home/home_page.dart';
import 'package:safe/presentation/login/login_page.dart';
import 'package:safe/presentation/home/rewards/rewards_page.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> pages = {
    "login_page": (BuildContext context) => const LoginPage(),
    "home_page": (BuildContext context) => const HomePage(),
    "rewards_page": (BuildContext context) => const RewardsPage(),
    "challenges_page": (BuildContext context) => const ChallengesPage(),
  };
}
