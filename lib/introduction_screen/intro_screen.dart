import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:introduction_screen/introduction_screen.dart';

import 'home_page.dart';

class IntroScreenPage extends StatefulWidget {
  const IntroScreenPage({Key? key}) : super(key: key);

  @override
  State<IntroScreenPage> createState() => _IntroScreenPageState();
}

class _IntroScreenPageState extends State<IntroScreenPage> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Colors.white,
              child: buildPageCom(
                  'assets/images/img1.jpg',
                  Colors.green.shade700,
                  "Food Express",
                  "Prepared by experts",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            ),
            Container(
              color: Colors.white,
              child: buildPageCom(
                  'assets/images/img2.jpg',
                  Colors.green.shade700,
                  "Food Express",
                  "Delivery to your home",
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
            ),
            Container(
              color: Colors.white,
              child: buildPageCom(
                'assets/images/img3.jpg',
                Colors.green.shade700,
                "Food Express",
                "Enjoy with everyone",
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              ),
            ),
          ],
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
        ),
      ),
      bottomSheet: isLastPage
          ?
          //true
          Container(
              height: 100,
              child: Center(
                  child: Container(
                      width: 100,
                      height: 40,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            //padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          },
                          child: const Text("Let's Go",
                              style: TextStyle(color: Colors.white))))))
          : Container(
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.circular(50),
                                topLeft: Radius.zero,
                                topRight: Radius.circular(50)),
                          ),
                          //padding: const EdgeInsets.all(16.0),
                          //textStyle: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: const Text("Skip",
                            style: TextStyle(color: Colors.green))),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                          spacing: 16,
                          dotColor: Colors.black26,
                          activeDotColor: Colors.green.shade700),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.zero,
                                topLeft: Radius.circular(50),
                                topRight: Radius.zero),
                          ),
                          //padding: const EdgeInsets.all(16.0),
                        ),
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        child: const Text("Next",
                            style: TextStyle(color: Colors.white))),
                  )
                ],
              ),
            ),
    );
  }

  //widget to add the image on screen
  Widget buildPageCom(String imagePath, Color color, String title,
      String title2, String subtitle) {
    return Container(
        //color: color,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        title,
        style:
            TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 20,
      ),
      Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          child: Text(
        title2,
        style: TextStyle(color: color, fontSize: 25),
      )),
      SizedBox(
        height: 20,
      ),
      Container(
          child: Text(
        subtitle,
        style: TextStyle(
          color: color,
        ),
      )),
    ]));
  }
}
