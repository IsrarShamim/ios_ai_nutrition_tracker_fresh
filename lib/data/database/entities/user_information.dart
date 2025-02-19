import 'package:isar/isar.dart';

part 'user_information.g.dart';

@Collection()
class UserInformationEntity {
  Id id = Isar.autoIncrement;
  String name;
  int age;
  double weight;
  String weightUnit;
  double height;
  String heightUnit;
  String gender;
  String location;
  String diet;
  List<String> goal;
  String currentActivityLevel;
  String exercise;
  int exerciseAmount;
  String weightGoal;
  String weightGoalPerWeek;
  List<String> weightRecordsForNext3Months;
  List<String> weightRecordsTimeForNext3Months;

  // Store the lists as strings in Isar
  String weightRecordsString = '';
  String weightRecordsTimeString = '';

  // Computed properties to access the lists
  List<String> get weightRecords => weightRecordsString.split(',').where((s) => s.isNotEmpty).toList();
  List<String> get weightRecordsTime => weightRecordsTimeString.split(',').where((s) => s.isNotEmpty).toList();

  // Methods to update the lists
  void setWeightRecords(List<String> records) {
    weightRecordsString = records.join(',');
  }

  void setWeightRecordsTime(List<String> times) {
    weightRecordsTimeString = times.join(',');
  }

  UserInformationEntity({
    this.id = 1,
    required this.name,
    required this.age,
    required this.weight,
    required this.weightUnit,
    required this.height,
    required this.heightUnit,
    required this.gender,
    required this.location,
    required this.diet,
    required this.goal,
    required this.currentActivityLevel,
    required this.exercise,
    required this.exerciseAmount,
    required this.weightGoal,
    required this.weightGoalPerWeek,
    required this.weightRecordsForNext3Months,
    required this.weightRecordsTimeForNext3Months,
    String? initialWeightRecords,
    String? initialWeightRecordsTime,
  }) {
    weightRecordsString = initialWeightRecords ?? '';
    weightRecordsTimeString = initialWeightRecordsTime ?? '';
  }

  UserInformationEntity copyWith({
    int? id,
    String? name,
    int? age,
    double? weight,
    String? weightUnit,
    double? height,
    String? heightUnit,
    String? gender,
    String? location,
    String? diet,
    List<String>? goal,
    String? currentActivityLevel,
    String? exercise,
    int? exerciseAmount,
    String? weightGoal,
    String? weightGoalPerWeek,
    List<String>? weightRecordsForNext3Months,
    List<String>? weightRecordsTimeForNext3Months,
    String? weightRecordsString,
    String? weightRecordsTimeString,
  }) {
    return UserInformationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      weightUnit: weightUnit ?? this.weightUnit,
      height: height ?? this.height,
      heightUnit: heightUnit ?? this.heightUnit,
      gender: gender ?? this.gender,
      location: location ?? this.location,
      diet: diet ?? this.diet,
      goal: goal ?? List.from(this.goal),
      currentActivityLevel: currentActivityLevel ?? this.currentActivityLevel,
      exercise: exercise ?? this.exercise,
      exerciseAmount: exerciseAmount ?? this.exerciseAmount,
      weightGoal: weightGoal ?? this.weightGoal,
      weightGoalPerWeek: weightGoalPerWeek ?? this.weightGoalPerWeek,
      weightRecordsForNext3Months: weightRecordsForNext3Months ?? List.from(this.weightRecordsForNext3Months),
      weightRecordsTimeForNext3Months: weightRecordsTimeForNext3Months ?? List.from(this.weightRecordsTimeForNext3Months),
      initialWeightRecords: weightRecordsString ?? this.weightRecordsString,
      initialWeightRecordsTime: weightRecordsTimeString ?? this.weightRecordsTimeString,
    );
  }
}