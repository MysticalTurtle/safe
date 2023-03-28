import 'package:flutter/material.dart';
import 'package:safe/core/config/preferences.dart';

import 'widgets/dots.dart';
import 'widgets/info_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int dots = 1;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        // controller.viewportFraction = 0.5;
        dots = controller.page!.toInt() + 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void nextPage() {
    if (dots == 3) {
      var prefs = SharedPreferencesPlantify();
      prefs.setOnboardingViewed(true);
      skip();
      return;
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
    );
  }

  void skip() {
    Navigator.pushReplacementNamed(context, "onboardingLast");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // color: const Color(0xff4f73b9),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff4f73b9),
                Color(0xff0198cf),
                Color(0xff7962AA),
                Color(0xff9255A2),
                Color(0xffB84493),
              ],
              stops: [0.0, 0.4, 0.80, 0.9, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  children: const [
                    InfoOnboarding(
                      imagePath: "assets/images/onboarding1.png",
                      title: "Gana premios",
                      description:
                          "Regístrate y participa de nuestrosorteo mensual",
                    ),
                    InfoOnboarding(
                      imagePath: "assets/images/onboarding2.png",
                      title: "Completa desafíos",
                      description:
                          "Con más puntos, podrás obtener mejores ofertas y más oportunidades de ganar.",
                    ),
                    InfoOnboarding(
                      imagePath: "assets/images/onboarding3.png",
                      title: "Resuelve tus dudas para mejorar",
                      description:
                          "Tenemos un chat dispuesto a responder tus dudas en base a nuestros servicios",
                    ),
                  ],
                ),
              ),
              // const Spacer(),
              Dots(currentIndex: dots),
              const SizedBox(height: 40),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // LightButton(
                    //   backgroundColor: Colors.transparent,
                    //   textColor: Colors.red,
                    //   text: "Omitir",
                    //   onPressed: () {
                    //     Navigator.pushReplacementNamed(context, "onboardingLast");
                    //   },
                    // ),
                    // LightButton(
                    //   text: "Continuar",
                    //   onPressed: nextPage,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
