import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadMessage() {
    final messages = <String>[
      "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!",
      "¿Cómo se dice pañuelo en japonés? ¡Saka-moko!",
      "¿Por qué los pájaros no usan WhatsApp? Porque ya tienen Twitter.",
      "¿Cuál es el colmo de un jardinero? ¡Tener malas plantas!",
      "¿Cuál es el colmo de Aladino? ¡Tener mal genio!",
      "¿Qué le dice una impresora a otra? ¡Esa hoja es mía!",
      "¿Cuál es el colmo de un astronauta? ¡Estar en la luna!",
      "¿Cuál es el vino más amargo? ¡El vino-credible!",
      "¿Por qué el semáforo no cruzó la calle? ¡Porque se puso rojo de vergüenza!",
      "Esto está tardando más de lo esperado... espera un poco mas :)"
    ];

    return Stream.periodic(const Duration(milliseconds: 3200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Espere"),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: getLoadMessage(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text("Cargando...");
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
