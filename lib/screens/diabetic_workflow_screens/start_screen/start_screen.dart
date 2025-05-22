import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:habbiton_diabetic_workflow/helpers/app_colors.dart';
import 'package:habbiton_diabetic_workflow/helpers/screen_config.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/assessement_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      backgroundColor: Colors.brown[400],
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    height: 826,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/startscreen_image.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                // Positioned.fill(
                //   child: SvgPicture.asset(
                //     'assets/images/startscreen_image.svg',
                //     fit: BoxFit.cover,
                //     alignment: Alignment.center,
                //     allowDrawingOutsideViewBox: true,
                //     clipBehavior: Clip.none,
                //   ),
                // ),
                Positioned(
                    top: 68,
                    left: 29,
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                          radius: 14.5,
                          backgroundColor: ColorConstants.white,
                          child: Center(
                              child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          ))),
                      // child: SvgPicture.asset(
                      //   'assets/images/back_button.svg',
                      //   fit: BoxFit.cover,
                      // ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(color: ColorConstants.grey, blurRadius: 10)
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Managing diabetes is a journey.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.Textcolor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "We're here to help every step of the way. Track sugar trends effortlessly, get AI insights, and connect with specialists — all in one place.",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.grey),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AssessementScreen(),
                                ));
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Start Managing My Health',
                            style: TextStyle(
                                fontSize: 16, color: ColorConstants.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
