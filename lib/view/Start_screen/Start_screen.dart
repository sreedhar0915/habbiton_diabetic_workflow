import 'package:flutter/material.dart';
import 'package:habbiton_diabetic_workflow/utilis/constants/color_constants.dart';
import 'package:habbiton_diabetic_workflow/view/assessement_screen/assessement_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEECBBE),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: AssetImage('assets/images/Group 679.png'),
                    fit: BoxFit.cover,
                  ))),
                ),
                Positioned(
                    top: 68,
                    left: 29,
                    child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/images/Group 1087.png")))
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
