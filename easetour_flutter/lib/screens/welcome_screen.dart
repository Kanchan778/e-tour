import 'package:easetour_flutter/utils/colors.dart';
import 'package:easetour_flutter/widgets/app_large_text.dart';
import 'package:easetour_flutter/widgets/app_text.dart';
import 'package:easetour_flutter/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    "welcome_one.jpg",
    "welcome_two.jpg",
    "welcome_three.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: "Discover",
                          size: 30,
                        ),
                        Container(
                            width: 250,
                            child: AppText(
                              text:
                                  "The world is a book and those who do not travel read only one page.Take only memories, leave only footprints",
                              color: Colors.deepPurpleAccent,
                              size: 20,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(),
                        SizedBox(
                          height: 40,
                        ),
                        ResponsiveButton(
                          width: 100,
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexslider) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexslider ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexslider
                                ? Colors.black54
                                : Colors.black54.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
