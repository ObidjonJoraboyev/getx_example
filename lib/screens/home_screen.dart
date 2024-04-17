import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_example/controller/quiz.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<QuizController>();

  int activePage = 0;

  final PageController pageController = PageController();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Image.asset(
              "assets/images/img.png",
              width: double.infinity,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "0${(controller.seconds.value ~/ 60)} : ${(controller.seconds.value % 60) < 10 ? "0${controller.seconds.value % 60}" : controller.seconds.value % 60}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  )),
            ),
            PageView(
              controller: pageController,
              onPageChanged: (v) {
                activePage = v;
                controller.deleteAnswer();
                controller
                    .randomLettersFunction(controller.answers[activePage]);
              },
              children: [
                ...List.generate(
                  controller.questions.length,
                  (indexPage) => Column(
                    children: [
                      const Spacer(),
                      Text(
                        controller.questions[indexPage],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 62,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            controller.answers[indexPage].length,
                            (index) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(3),
                                      shape: BoxShape.rectangle,
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 0,
                                            color: Color(0xff3E87FF),
                                            spreadRadius: 2)
                                      ]),
                                  child: Center(
                                    child: Text(
                                      controller.answer.value.length > index
                                          ? controller.answer.value[index]
                                          : "",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ),
                                )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Wrap(
                        children: [
                          ...List.generate(
                            11,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed: () {
                                    controller.addAnswer(
                                        controller.randomLetters[index],
                                        activePage,
                                        indexPage,
                                        index,
                                        pageController);
                                    if (controller.answer.value ==
                                        controller.answers[indexPage]) {
                                      controller.checkAnswer(indexPage,
                                          activePage, pageController);
                                    }
                                  },
                                  child: Text(
                                    controller.randomLetters[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {
                                  controller.removeSingleSymbol();
                                },
                                child: const Icon(
                                  Icons.backspace_outlined,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          activePage+=1;
                          pageController.jumpToPage(activePage);
                        },
                        child: const Text("Next"),
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
