import 'dart:math';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/result_screen.dart';

class QuizController extends GetxController {
  RxString answer = "".obs;
  RxInt seconds = 0.obs;

  RxString timeString = "Vaqt: 3 daqiqa".obs;

  setTimeString(String string) {
    timeString.value = string;
  }

  RxList<int> correct = <int>[].obs;
  RxList<String> randomLetters = <String>[].obs;
  RxList<String> questions = [
    "NIMAGAP",
    "A javob togri",
    "B javob togri",
  ].obs;

  RxList<String> answers = [
    "TINCH",
    "A",
    "B",
  ].obs;

  addAnswer(String string, int activePage, int indexPage, int index,
      PageController pageController) {
    if (answer.value.length < answers[indexPage].length) {
      answer.value += string;
    }

    if (answer.value.toLowerCase() != answers[indexPage].toLowerCase() &&
        answer.value.length == answers[indexPage].length) {
      Get.showSnackbar(
        const GetSnackBar(
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 1),
          messageText: Text(
            "Noto'g'ri Javob ☹️",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      deleteAnswer();
    }
  }

  checkAnswer(int indexPage, int activePage, PageController pageController) {
    if (activePage+1  == answers.length &&
        answer.value.toLowerCase() == answers[indexPage].toLowerCase()) {
      check.value = false;
      Get.off(() => const ResultScreen());
    }
    if (answer.value.toLowerCase() == answers[indexPage].toLowerCase()) {
      correct.add(1);

      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(seconds: 1),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          messageText: Text(
            "Togri Javob 🥳",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      );
      deleteAnswer();
      activePage++;
      pageController.animateToPage(activePage,
          duration: const Duration(milliseconds: 700), curve: Curves.linear);
    }
  }

  deleteAnswer() {
    answer.value = "";
  }

  RxBool check = true.obs;
  timerStart({required int minute}) async {
    correct.value = [];
    seconds.value = minute * 60;

    for (int i = 0; check.value; i++) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (seconds.value > 0 && check.value) {
          seconds = seconds - 1;
        } else {
          check.value = false;
          Get.off(() => const ResultScreen());
        }
      });
    }
  }

  removeSingleSymbol() {
    if (answer.value.isNotEmpty) {
      answer.value = answer.value.substring(0, answer.value.length - 1);
    }
  }

  randomLettersFunction(String answer) {
    randomLetters.value = [];
    for (int i = 0; i < answer.length; i++) {
      randomLetters.add(answer[i]);
    }
    for (int i = 0; i < (11 - answer.length); i++) {
      randomLetters.add(String.fromCharCode(Random().nextInt(26) + 65));
    }

    randomLetters.shuffle();
  }
}
