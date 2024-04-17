import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controller/quiz.dart';
import 'package:getx_example/screens/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final controller =
      Get.put(QuizController()..randomLettersFunction("TASHKENT"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/img.png",
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Text(
                  controller.timeString.value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      shadows: [Shadow(blurRadius: 20, color: Colors.white)]),
                ),
                const SizedBox(
                  height: 100,
                ),
                PopupMenuButton<String>(
                  icon: const Text(
                    "Vaqtni o'zgartirish",
                    style: TextStyle(color: Colors.black),
                  ),
                  onSelected: (String result) {
                    controller.setTimeString(result);

                    setState(() {});
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Vaqt: 1 daqiqa',
                      child: Text('1 daqiqa'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Vaqt: 3 daqiqa',
                      child: Text('3 daqiqa'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Vaqt: 5 daqiqa',
                      child: Text('5 daqiqa'),
                    ),
                  ],
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    "Testni Boshlash",
                    style: TextStyle(
                        color: Colors.white, shadows: [Shadow(blurRadius: 10)]),
                  ),
                  onPressed: () {
                    controller.timerStart(
                        minute: int.parse(controller.timeString.split(" ")[1]));
                    Get.to(() => HomeScreen());
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
