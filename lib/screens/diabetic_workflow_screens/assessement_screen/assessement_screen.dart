import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/model/assessement_model.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/provider/assessement_provider.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/dashboard_screen/dashboard_screen.dart';
import 'package:provider/provider.dart';
import 'package:habbiton_diabetic_workflow/helpers/app_colors.dart';
import 'package:habbiton_diabetic_workflow/helpers/screen_config.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/Start_screen/Start_screen.dart';

class AssessementScreen extends StatefulWidget {
  const AssessementScreen({super.key});

  @override
  State<AssessementScreen> createState() => _AssessementScreenState();
}

class _AssessementScreenState extends State<AssessementScreen> {
  final _formKey = GlobalKey<FormState>();
  String? diabetesType;
  bool? isOnMedication;
  String? selectedMedication;
  String? syncChoice;

  final TextEditingController hba1cController = TextEditingController();
  final TextEditingController otherComplicationController =
      TextEditingController();

  final List<String> diabetesTypes = [
    'Type 1',
    'Type 2',
    'Gestational',
    'Prediabetes'
  ];
  final List<String> medicationOptions = ['Metformin', 'Insulin', 'Other'];
  final List<String> complications = [
    'Neuropathy',
    'Retinopathy',
    'Nephropathy',
    'None'
  ];
  Map<String, bool> selectedComplications = {};

  @override
  void initState() {
    super.initState();
    for (var comp in complications) {
      selectedComplications[comp] = false;
    }
  }

  Future<void> _saveForm(DiabetesController controller) async {
    if (diabetesType == null) {
      Fluttertoast.showToast(msg: "Please select your diabetes type.");
      return;
    }
    if (isOnMedication == null) {
      Fluttertoast.showToast(msg: "Please select medication status.");
      return;
    }
    final selectedCompList = selectedComplications.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final double? hba1cValueParsed =
        double.tryParse(hba1cController.text.trim());
    if (hba1cController.text.isNotEmpty && hba1cValueParsed == null) {
      Fluttertoast.showToast(msg: "Please enter a valid HbA1c value.");
      return;
    }

    final model = DiabetesModel(
      diabetesType: diabetesType!,
      onMedication: isOnMedication!,
      medications: isOnMedication! && selectedMedication != null
          ? [selectedMedication!]
          : [],
      diagnosisYear: 2015,
      hba1cValue: hba1cValueParsed ?? 0.0,
      complications: selectedCompList,
      otherComplications: otherComplicationController.text.trim(),
      wearableSync: syncChoice == 'sync',
    );

    final success = await controller.postDiabetesData(model);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return ChangeNotifierProvider(
      create: (context) => DiabetesController(),
      child: Consumer<DiabetesController>(
        builder: (context, controller, child) {
          return Scaffold(
            backgroundColor: ColorConstants.white,
            appBar: AppBar(
              surfaceTintColor: ColorConstants.white,
              backgroundColor: ColorConstants.white,
              leading: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StartScreen()));
                },
                child: Icon(Icons.arrow_back_ios_new),
              ),
              title: Center(
                child: Text("Assessment",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              ),
            ),
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Answer a few quick questions to help us understand you better.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.Textcolor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'What type of diabetes do you have?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black),
                      ),
                      Column(
                        children: diabetesTypes.map((type) {
                          return RadioListTile<String>(
                            title: Text(type),
                            value: type,
                            groupValue: diabetesType,
                            activeColor: Colors.green,
                            onChanged: (val) {
                              setState(() {
                                diabetesType = val;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Are you currently on any medication?",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text('Yes'),
                              value: true,
                              groupValue: isOnMedication,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                setState(() => isOnMedication = val);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<bool>(
                              title: Text('No'),
                              value: false,
                              groupValue: isOnMedication,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() => isOnMedication = value);
                              },
                            ),
                          ),
                        ],
                      ),
                      if (isOnMedication == true) ...[
                        Text(
                          "If Yes, List your medications",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.grey),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.Textfieldcolor,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 1,
                                      blurRadius: 8,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConstants.Textfieldcolor,
                                    hintText: 'Select',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  value: selectedMedication,
                                  onChanged: (val) {
                                    setState(() => selectedMedication = val);
                                  },
                                  items: medicationOptions
                                      .map((med) => DropdownMenuItem<String>(
                                            child: Text(med),
                                            value: med,
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                      SizedBox(height: 20),
                      Text(
                        "Do you know your latest HbA1c value? (optional)",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.Textfieldcolor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: hba1cController,
                          decoration: InputDecoration(
                            hintText: 'Enter here',
                            filled: true,
                            fillColor: ColorConstants.Textfieldcolor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Are you experiencing any diabetes-related complications?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black),
                      ),
                      Column(
                        children: complications.map((comp) {
                          return CheckboxListTile(
                            title: Text(comp),
                            value: selectedComplications[comp],
                            onChanged: (val) {
                              setState(() {
                                selectedComplications[comp] = val!;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.green,
                          );
                        }).toList(),
                      ),
                      Text(
                        "Other (Specify)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.grey),
                      ),
                      SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.Textfieldcolor,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: otherComplicationController,
                          decoration: InputDecoration(
                            hintText: 'Enter here',
                            filled: true,
                            fillColor: ColorConstants.Textfieldcolor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Would you like to sync your wearable device to auto-track steps and heart rate?',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.black),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: Text("Yes, sync now",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.grey)),
                              value: 'sync',
                              groupValue: syncChoice,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                setState(() => syncChoice = val);
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: Text('Not right now',
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.grey)),
                              value: 'no_sync',
                              groupValue: syncChoice,
                              activeColor: Colors.green,
                              onChanged: (val) {
                                setState(() => syncChoice = val);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.isLoading
                                ? null
                                : () => _saveForm(controller),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: controller.isLoading
                                ? CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    'Save',
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
            ),
          );
        },
      ),
    );
  }
}
