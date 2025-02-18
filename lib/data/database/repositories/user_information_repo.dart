import 'package:isar/isar.dart';
import '../../../main.dart';
import '../../util/GetDate.dart';
import '../entities/user_information.dart'; // Import your entity

class UserInfoRepository {
  // Get the Isar collection for UserInformationEntity
  IsarCollection<UserInformationEntity> get _userInfoCollection =>
      isar.collection<UserInformationEntity>();

  Future<UserInformationEntity?> getUserInformationEntity() async {
    return await _userInfoCollection.get(userId); // Get the single user
  }
  static const int userId = 1; // Single user entity with fixed ID

  Future<void> deleteAllUserInformationEntity() async {
    await isar.writeTxn(() async {
      await _userInfoCollection.clear(); // Clears all data
    });
  }

  Future<void> insertUserInformation(UserInformationEntity userInformation) async {
    userInformation.id = userId; // Ensure the ID is always 1
    await isar.writeTxn(() async {
      await _userInfoCollection.put(userInformation);
    });
  }




  Stream<UserInformationEntity?> getUserInformationEntityWithFlow() {
    return _userInfoCollection.watchObject(userId);
  }

  Future<UserInformationEntity?> getTodayUserInformationEntity() async {
    return await _userInfoCollection.get(userId);
  }

  Future<UserInformationEntity?> checkIfNutritionalValueExistsOrNot() async {
    return await _userInfoCollection.get(userId);
  }

  Future<void> _updateUser(void Function(UserInformationEntity user) update) async {
    await isar.writeTxn(() async {
      final user = await _userInfoCollection.get(userId);
      if (user != null) {
        update(user);
        await _userInfoCollection.put(user);
      }
    });
  }

  Future<void> updateAge(int age) async => _updateUser((user) => user.age = age);
  Future<void> updateWeight(double weight) async => _updateUser((user) => user.weight = weight);
  Future<void> updateName(String name) async => _updateUser((user) => user.name = name);
  Future<void> updateWeightUnit(String weightUnit) async => _updateUser((user) => user.weightUnit = weightUnit);
  Future<void> updateHeight(double height) async => _updateUser((user) => user.height = height);
  Future<void> updateHeightUnit(String heightUnit) async => _updateUser((user) => user.heightUnit = heightUnit);
  Future<void> updateGender(String gender) async => _updateUser((user) => user.gender = gender);
  Future<void> updateLocation(String location) async => _updateUser((user) => user.location = location);
  Future<void> updateDiet(String diet) async => _updateUser((user) => user.diet = diet);
  Future<void> updateGoal(List<String> goal) async => _updateUser((user) => user.goal = goal);
  Future<void> updateCurrentActivityLevel(String level) async => _updateUser((user) => user.currentActivityLevel = level);
  Future<void> updateExercise(String exercise) async => _updateUser((user) => user.exercise = exercise);
  Future<void> updateExerciseAmount(int amount) async => _updateUser((user) => user.exerciseAmount = amount);
  Future<void> updateWeightGoal(String weightGoal) async => _updateUser((user) => user.weightGoal = weightGoal);
  Future<void> updateWeightGoalPerWeek(String weightGoalPerWeek) async => _updateUser((user) => user.weightGoalPerWeek = weightGoalPerWeek);


  Future<void> addWeightRecord(double newWeight) async {
    await isar.writeTxn(() async {
      final user = await getUserInformationEntity();
      if (user != null) {
        final updatedWeightRecords = user.weightRecords..add(newWeight.toString());
        final updatedTimeRecords = user.weightRecordsTime..add(getYesterdayDate());

        user.setWeightRecords(updatedWeightRecords);
        user.setWeightRecordsTime(updatedTimeRecords);

        await isar.userInformationEntitys.put(user);
      }
    });
  }

  Future<void> updateLatestWeightRecord(double newWeight) async {
    await isar.writeTxn(() async {
      final user = await getUserInformationEntity();
      if (user != null) {
        final updatedWeightRecords = user.weightRecords;
        final updatedTimeRecords = user.weightRecordsTime;

        if (updatedWeightRecords.isNotEmpty) {
          updatedWeightRecords[updatedWeightRecords.length - 1] = newWeight.toString();
          updatedTimeRecords[updatedTimeRecords.length - 1] = getCurrentDate();
        } else {
          updatedWeightRecords.add(newWeight.toString());
          updatedTimeRecords.add(getCurrentDate());
        }

        user.setWeightRecords(updatedWeightRecords);
        user.setWeightRecordsTime(updatedTimeRecords);

        await isar.userInformationEntitys.put(user);
      }
    });
  }

  // Future<void> deleteWeightRecord(int index) async {
  //   // final isar = await db;
  //   await isar.writeTxn(() async {
  //     final user = await getUserInformationEntity();
  //     if (user != null &&
  //         index >= 0 &&
  //         index < user.weightRecords.length &&
  //         index < user.weightRecordsTime.length) {
  //       final List<String> updatedWeightRecords = List<String>.from(user.weightRecords);
  //       final List<String> updatedTimeRecords = List<String>.from(user.weightRecordsTime);
  //
  //       updatedWeightRecords.removeAt(index);
  //       updatedTimeRecords.removeAt(index);
  //
  //       user.weightRecords = updatedWeightRecords;
  //       user.weightRecordsTime = updatedTimeRecords;
  //
  //       await isar.userInformationEntitys.put(user);
  //     }
  //   });
  // }


  Future<void> clearAllWeightRecords() async {
    // final isar = await db;
    await isar.writeTxn(()  async {
      final user = await getUserInformationEntity();
      if (user != null) {
        user.weightRecords.clear();
        user.weightRecordsTime.clear();
        await isar.userInformationEntitys.put(user);
      }
    });
  }

  Future<List<Map<String, String>>> getWeightHistory() async {
    final user = await getUserInformationEntity();
    if (user != null &&
        user.weightRecords.isNotEmpty &&
        user.weightRecords.length == user.weightRecordsTime.length) {
      return List.generate(
        user.weightRecords.length,
            (index) => {
          'weight': user.weightRecords[index],
          'date': user.weightRecordsTime[index],
        },
      );
    }
    return [];
  }
  
  // Future<void> addWeightRecord(String newWeight, String newTimestamp) async {
  //   await _updateUser((user) {
  //     user.weightRecords.add(newWeight);
  //     user.weightRecordsTime.add(newTimestamp);
  //   });
  // }

  // Future<void> updateWeightRecord(String newWeight, String newTimestamp) async {
  //   await _updateUser((user) {
  //     user.weightRecords = [newWeight];
  //     user.weightRecordsTime = [newTimestamp];
  //   });
  // }

  Future<void> addWeightRecordsForNext3Months(String weight, String timestamp) async {
    await _updateUser((user) {
      user.weightRecordsForNext3Months.add(weight);
      user.weightRecordsTimeForNext3Months.add(timestamp);
    });
  }

  Future<void> setWeightRecordsForNext3Months(String weight, String timestamp) async {
    await _updateUser((user) {
      user.weightRecordsForNext3Months = [weight];
      user.weightRecordsTimeForNext3Months = [timestamp];
    });
  }
}