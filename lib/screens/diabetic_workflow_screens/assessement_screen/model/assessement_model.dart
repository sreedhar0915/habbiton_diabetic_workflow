class DiabetesModel {
  String diabetesType;
  bool onMedication;
  List<String> medications;
  int diagnosisYear;
  double hba1cValue;
  List<String> complications;
  String otherComplications;
  bool wearableSync;

  DiabetesModel({
    required this.diabetesType,
    required this.onMedication,
    required this.medications,
    required this.diagnosisYear,
    required this.hba1cValue,
    required this.complications,
    required this.otherComplications,
    required this.wearableSync,
  });

  Map<String, dynamic> toJson() {
    return {
      "diabetes_type": diabetesType,
      "on_medication": onMedication,
      "medications": medications,
      "diagnosis_year": diagnosisYear,
      "hba1c_value": hba1cValue,
      "complications": complications,
      "other_complications": otherComplications,
      "wearable_sync": wearableSync,
    };
  }

  factory DiabetesModel.fromJson(Map<String, dynamic> json) {
    return DiabetesModel(
      diabetesType: json['diabetes_type'],
      onMedication: json['on_medication'],
      medications: List<String>.from(json['medications']),
      diagnosisYear: json['diagnosis_year'],
      hba1cValue: json['hba1c_value'].toDouble(),
      complications: List<String>.from(json['complications']),
      otherComplications: json['other_complications'],
      wearableSync: json['wearable_sync'],
    );
  }
}
