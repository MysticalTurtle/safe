import 'package:flutter/material.dart';
import 'package:safe/presentation/levels/levels_page.dart';
import 'image_card.dart';

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                //NIVEL 1
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/if.jpg'),
                        tags: [_tag('Condicionales', () {})],
                        title: _title('IF'),
                        description: _content(
                            'Conoce el condicional IF. ¿Cumple con la condición? ejecuta la acción'),
                        footer: _footer('Nivel 1'),
                      ),
                    ],
                  ),
                ),
                //NIVEL 2
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/ifelse.jpg'),
                        tags: [_tag('Condicionales', () {})],
                        title: _title('IF-ELSE'),
                        description: _content(
                            '¿No se cumple la condición? añade otra opción'),
                        footer: _footer('Nivel 2'),
                      ),
                    ],
                  ),
                ),
                //NIVEL 3
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/switch.jpg'),
                        tags: [_tag('Condicionales', () {})],
                        title: _title('SWITCH'),
                        description: _content(
                            '¿Muchas opciones? define sus instrucciones de antemano'),
                        footer: _footer('Nivel 3'),
                      ),
                    ],
                  ),
                ),
                //NIVEL 4
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/loop.jpg'),
                        tags: [_tag('Bucles', () {})],
                        title: _title('FOR'),
                        description: _content(
                            'Conoce las estructuras de control ¿Cuántas veces repetir una acción?'),
                        footer: _footer('Nivel 4'),
                      ),
                    ],
                  ),
                ),
                //NIVEL 5
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/while.png'),
                        tags: [_tag('Bucles', () {})],
                        title: _title('WHILE'),
                        description: _content(
                            '¡Ejecuta una instrucción mientras se cumpla la condición!'),
                        footer: _footer('Nivel 5'),
                      ),
                    ],
                  ),
                ),
                //NIVEL 6
                const SizedBox(height: 12),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      FillImageCard(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const LevelPage();
                          }));
                        },
                        width: 350,
                        heightImage: 180,
                        imageProvider:
                            const AssetImage('assets/category/dowhile.png'),
                        tags: [_tag('Bucles', () {})],
                        title: _title('DO WHILE'),
                        description: _content(
                            'Ejecuta la instrucción al menos una vez ¡no importa si no cumple alguna condición!'),
                        footer: _footer('Nivel 6'),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _title(titulo) {
    return Text(
      titulo,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  Widget _content(descripcion) {
    return Text(
      descripcion,
    );
  }

  Widget _footer(nivel) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            'assets/category/estrella.png',
          ),
          radius: 12,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
            child: Text(
          nivel,
        )),
        IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle))
      ],
    );
  }

  Widget _tag(String tag, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.green),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          tag,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
