import 'package:flutter/material.dart';
import 'package:habbiton_diabetic_workflow/utilis/constants/color_constants.dart';
import 'package:habbiton_diabetic_workflow/view/dailylog_screen/dailylog_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Good Morning,",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.Textcolor)),
                  Text(" Vineeth!",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.black)),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailylogScreen(),
                            ));
                      },
                      child: Chip(label: Text('Daily Log'))),
                ],
              ),
              Text(
                '11/10/24, Monday',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.grey),
              ),
              SizedBox(height: 16),
              Container(
                height: 226,
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Glucose Trend (Last 7 Days)',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      SizedBox(height: 4),
                      Text('Average: 112 mg/dL — Within safe range',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.grey)),
                      SizedBox(height: 15),
                      Container(
                        height: 132,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Frame 1108.png"))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "AI Risk Status",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            height: 36,
                            width: 145,
                            decoration: BoxDecoration(
                                color: ColorConstants.amber,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text("Moderate",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: ColorConstants.white)),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 137,
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 59,
                            width: 67,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/Rectangle 679.png"),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Meera Arun",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 14),
                              Text(
                                "Diabetologist & Endocrinologist",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              //SizedBox(height: 5),
                              Text(
                                "12 years experience",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 36,
                          decoration: BoxDecoration(
                              color: ColorConstants.Textcolor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                            "Book An Appointment",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.white),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 127,
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Workout Overview',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Container(
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/dd4dd9b590706af686c6dcd72e0187389abd6455.png"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                      // SizedBox(height: 5),
                      Text(
                        '4/7 days active this week. Aim for consistency!',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.grey),
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            ["M", "T", "W", "T", "F", "S", "S"].map((date) {
                          Color color =
                              date == 'M' || date == 'T' || date == 'F'
                                  ? ColorConstants.Textcolor
                                  : ColorConstants.red;
                          return Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: ColorConstants.white,
                                child: Text(date),
                              ));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 134.57,
                decoration: BoxDecoration(
                  color: ColorConstants.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Daily Water Intake',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          Container(
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/material-symbols-light_water-full.png"),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                      Text(
                        '2 glasses down, 6 to go! Tap to log',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.grey),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "0.5/",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.blue),
                          ),
                          Row(
                            children: List.generate(
                              8,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: index < 2
                                    ? Image.asset("assets/images/Layer 3.png")
                                    : Image.asset("assets/images/Layer 6.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '2 liters',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.Textcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Text(
                      'View AI Insights',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
