import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:lottie/lottie.dart';

import '../notification/notification_api.dart';
import '../widgets/button_timer.dart';

class CountdownPage extends StatefulWidget {
  const CountdownPage({Key? key}) : super(key: key);

  @override
  State<CountdownPage> createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage>
    with TickerProviderStateMixin {
  late AnimationController controller;

  bool isPlaying = false;
  bool finish = false;
  bool showTimeUpAnimation = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      FlutterRingtonePlayer.playNotification(asAlarm: true);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 0),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });

        if (controller.isDismissed) {
          // Mostrar la animación de tiempo agotado
          setState(() {
            showTimeUpAnimation = true;
          });
          // Mostrar la notificación cuando el tiempo esté a punto de terminar (últimos 10 segundos, por ejemplo)

          // Ocultar la animación de tiempo agotado después de 3 segundos
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              showTimeUpAnimation = false;
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade300,
                    value: progress,
                    strokeWidth: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isDismissed) {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          height: 200,
                          child: CupertinoTimerPicker(
                            initialTimerDuration: controller.duration!,
                            onTimerDurationChanged: (time) {
                              setState(() {
                                controller.duration = time;
                              });
                            },
                          ),
                        ),
                      );
                    }
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => Text(
                      countText,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (finish) // Mostrar la animación de "Terminar"
                  AnimatedOpacity(
                    opacity: finish ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 1500),
                    child: Lottie.asset(
                      "assets/json/success.json", // Reemplaza "your_finish_animation" con el nombre de tu archivo de animación
                      // repeat: false,
                    ),
                  ),
                if (showTimeUpAnimation) // Mostrar la animación de tiempo agotado
                  AnimatedOpacity(
                    opacity: showTimeUpAnimation ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 1500),
                    child: Lottie.asset(
                      "assets/json/sad.json", // Reemplaza "your_time_up_animation" con el nombre de tu archivo de animación
                      // repeat: false,
                    ),
                  ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {
              if (controller.isAnimating) {
                setState(() {
                  isPlaying = false;
                  finish = true;
                });
                controller.stop();
              }
              Future.delayed(Duration(milliseconds: 1500), () {
                setState(() {
                  finish = false;
                });
              });

              // FlutterAlarmClock.createAlarm(hour: 0, minutes: 1);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              backgroundColor: const Color.fromRGBO(11, 117, 133, 1),
              elevation: 9,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Terminar",
                style: TextStyle(fontSize: 22, color: Color(0xFFF1F1F1)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.stop();
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      controller.reverse(
                          from: controller.value == 0 ? 1.0 : controller.value);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                    if (isPlaying == false) {
                      Timer(
                          Duration(
                              seconds: controller.duration!.inSeconds - 12),
                          () {
                        showNotification(
                            title: '¡Cuenta regresiva!',
                            body: 'El tiempo está a punto de terminar.');
                      });
                    }
                  },
                  child: RoundButton(
                    icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isAnimating) {
                      controller.reset();
                      setState(() {
                        isPlaying = false;
                        showTimeUpAnimation = false;
                      });
                    }
                  },
                  child: const RoundButton(
                    icon: Icons.stop,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
