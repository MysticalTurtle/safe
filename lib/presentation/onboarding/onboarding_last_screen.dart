import 'package:flutter/material.dart';
import 'package:safe/core/config/preferences.dart';
import 'package:safe/core/constants/app_colors.dart';
import 'package:safe/core/constants/app_text_style.dart';
import 'package:safe/presentation/widgets/planty_button.dart';

class OnboardingLastScreen extends StatelessWidget {
  const OnboardingLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SharedPreferencesPlantify prefs = SharedPreferencesPlantify();
    prefs.setOnboardingViewed(true);

    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            children: [
              RichText(
                text: const TextSpan(
                  text: "¡Descubre ",
                  style: TextStyles.lastOnboardingBlack,
                  children: [
                    TextSpan(
                      text: "RecogPlantify!",
                      style: TextStyles.lastOnboardingGreen,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  text: "Una app fácil y rápida para aprender sobre ",
                  style: TextStyles.lastOnboardingBlack400,
                  children: [
                    TextSpan(
                      text: "plantas",
                      style: TextStyles.lastOnboardingGreen400,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Image.asset("assets/images/cellphone.png"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/leaf_filled.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/leaf_empty.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/leaf_empty.png"),
                  const SizedBox(width: 10),
                  Image.asset("assets/images/leaf_empty.png"),
                ],
              ),
              const SizedBox(height: 10),
              RichText(
                text: const TextSpan(
                  text: "Recogplantify ",
                  style: TextStyles.lastOnboardingGreen400,
                  children: [
                    TextSpan(
                      text: "ofrece lo siguiente",
                      style: TextStyles.lastOnboardingBlack400,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("• "),
                    Expanded(
                        child: Text(
                            "Reconocimiento e información de más de 50.000 plantas")),
                  ]),
              const SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("• "),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      text:
                          "Uso rápido y sencillo, ¡solo apunta con tu cámara hacia una planta de tu interés y ",
                      style: TextStyles.lastOnboardingBlack400,
                      children: [
                        TextSpan(
                          text: "RecogPlantify",
                          style: TextStyles.lastOnboardingGreen400,
                        ),
                        TextSpan(
                          text: " hará el resto!",
                          style: TextStyles.lastOnboardingBlack400,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 10),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("• "),
                    Expanded(
                        child: Text(
                            "¡Incluye diagnóstico en tiempo real sobre la planta identificada!")),
                  ]),
              const SizedBox(height: 10),
              _TransparentButton(
                  text: "Iniciar sesión",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "login");
                  }),
              PlantyButton(
                  isDark: false,
                  text: "Registrarte",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "register");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransparentButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const _TransparentButton({required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.primaryBlue),
          ),
        ),
      ),
    );
  }
}
