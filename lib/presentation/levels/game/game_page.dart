import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safe/presentation/widgets/custom_appbar.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: [
          Image.asset("assets/category/if.jpg", height: 50, fit: BoxFit.cover),
          const SizedBox(
            height: 10,
          ),
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
          const Text(
            "Une las piezas para completar el siguiente enunciado",
            style: TextStyle(
              fontFamily: "UbuntuMono",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 210, 210),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
            ),
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.all(30),
            child: const Text(
              "Si Mariana tiene cereal y yogurt, entonces puede hacer un desayuno",
              style: TextStyle(
                fontFamily: "UbuntuMono",
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Board(),
        ],
      ),
    );
  }
}

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Draggable<String>(
              data: "SI",
              feedback: Material(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/azul.svg",
                    ),
                    const Text(
                      "ENTONCES",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              childWhenDragging: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/azul.svg",
                  ),
                  const Text("ENTONCES"),
                ],
              ),
            ),
            Draggable<String>(
              data: "puede hacer un desayuno",
              feedback: Material(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/pieces/celeste.png",
                        height: 100, fit: BoxFit.cover),
                    const Text("Puede hacer\nun desayuno"),
                  ],
                ),
              ),
              childWhenDragging: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/pieces/celeste.png",
                      height: 100, fit: BoxFit.cover),
                  const Text("Puede hacer\nun desayuno"),
                ],
              ),
            ),
            Draggable<String>(
              data: "SI",
              feedback: Material(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/pieces/azul.png",
                        height: 100, fit: BoxFit.cover),
                    const Text("SI"),
                  ],
                ),
              ),
              childWhenDragging: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/pieces/azul.png",
                      height: 100, fit: BoxFit.cover),
                  const Text("SI"),
                ],
              ),
            ),
            Draggable<String>(
              data: "Maria tiene cereal\ny yogurt",
              feedback: Material(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/pieces/celeste.png",
                        height: 100, fit: BoxFit.cover),
                    const Text("Maria tiene cereal\ny yogurt"),
                  ],
                ),
              ),
              childWhenDragging: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/pieces/celeste.png",
                      height: 100, fit: BoxFit.cover),
                  const Text("Maria tiene cereal\ny yogurt"),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return SvgPicture.asset(
                  "assets/svg/gris.svg",
                );
              },
              onAccept: (String data) {
                setState(() {
                  acceptedData == data;
                });
              },
            ),
            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return SvgPicture.asset(
                  "assets/svg/gris.svg",
                );
              },
              onAccept: (String data) {
                setState(() {
                  acceptedData == data;
                });
              },
            ),
            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return SvgPicture.asset(
                  "assets/svg/gris.svg",
                );
              },
              onAccept: (String data) {
                setState(() {
                  acceptedData == data;
                });
              },
            ),
            DragTarget<String>(
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return SvgPicture.asset(
                  "assets/svg/gris.svg",
                );
              },
              onAccept: (String data) {
                setState(() {
                  acceptedData == data;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
