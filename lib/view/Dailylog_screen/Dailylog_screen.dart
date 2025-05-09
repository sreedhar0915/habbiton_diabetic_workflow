import 'package:flutter/material.dart';
import 'package:habbiton_diabetic_workflow/utilis/constants/color_constants.dart';
import 'package:habbiton_diabetic_workflow/view/Global_widget/Sugar_inputfield.dart';

class DailylogScreen extends StatefulWidget {
  const DailylogScreen({super.key});

  @override
  State<DailylogScreen> createState() => _DailylogScreenState();
}

class _DailylogScreenState extends State<DailylogScreen> {
  final TextEditingController notesController = TextEditingController();

  List<String> symptoms = [
    "Fatigue",
    "Frequent Urination",
    "Blurred Vision",
    "Dizziness",
    "None"
  ];
  Set<String> selectedSymptoms = {};

  void toggleSymptom(String symptom) {
    setState(() {
      if (symptom == "None") {
        selectedSymptoms = {"None"};
      } else {
        selectedSymptoms.remove("None");
        if (selectedSymptoms.contains(symptom)) {
          selectedSymptoms.remove(symptom);
        } else {
          selectedSymptoms.add(symptom);
        }
      }
    });
  }

  Widget buildSymptomButton(String label) {
    final isSelected = selectedSymptoms.contains(label);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? ColorConstants.Textcolor : Colors.white,
        foregroundColor: isSelected ? Colors.white : ColorConstants.Textcolor,
        side: BorderSide(color: Colors.green),
      ),
      onPressed: () => toggleSymptom(label),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.white,
        surfaceTintColor: ColorConstants.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/images/Group 1087.png")),
        title: Center(
          child: Text(
            "Daily Blood Sugar Entry",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter your readings",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            SizedBox(height: 10),
            Column(
              children: [
                SugarInputField(
                  label: 'Fasting Blood Sugar',
                  onChanged: (val) => print('Fasting: $val'),
                ),
                SugarInputField(
                  label: 'Postprandial Blood Sugar',
                  subtitle: '(2 hours after a meal)',
                  onChanged: (val) => print('Post-meal: $val'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Are You Experiencing Any Symptoms?",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            SizedBox(height: 5),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: symptoms.map(buildSymptomButton).toList(),
            ),
            SizedBox(height: 20),
            Text("Additional Notes (optional)",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            SizedBox(height: 5),
            Container(
              height: 156,
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
              child: TextField(
                controller: notesController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Type anything you noticed today...",
                  hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.grey),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConstants.white, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.Textcolor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  ShowSuccessDialog(context);
                },
                child: Text(
                  "Save & Analyze",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ColorConstants.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void ShowSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 232,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black54),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    Container(
                      height: 83,
                      width: 83,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/8354e55a550db97d68dba2a540a717158cbfcede.png"))),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "This level is within a\nhealthy range.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
