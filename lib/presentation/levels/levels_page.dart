import 'package:flutter/material.dart';
import 'package:safe/presentation/widgets/custom_appbar.dart';

import 'game/game_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        body: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Image.asset("assets/category/if.jpg"),
            const SizedBox(height: 10),
            const Text(
              "IF - ELSE",
              style: TextStyle(
                fontFamily: "UbuntuMono",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            LevelCard(
                text: "Nivel 1: Ayuda a Mariana con su desayuno",
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const GamePage();
                  }));
                }),
            LevelCard(
                text: "Nivel 2: Escoge un camino de programador", onTap: () {}),
            LevelCard(
                text: "Nivel 3: Decide tu deporte favorito", onTap: () {}),
          ],
        ));
  }
}

class LevelCard extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const LevelCard({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 213, 227, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
