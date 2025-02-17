// nutrition_repository.dart
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/nutrition_entities.dart';
import 'package:ai_nutrition_tracker_for_ios/data/database/entities/nutrition_goal_holder.dart';
import 'package:isar/isar.dart';

// import '../../data_classes/nutrition/NutrientDataClasses.dart';


class NutritionRepository {
  final Isar isar;

  NutritionRepository(this.isar);

  Stream<void> watchNutritions() { // Listen for changes in the Nutrition collection
    return isar.nutritions.watchLazy();
  }

  Future<List<Nutrition>> getAllNutritions() async {
    return isar.nutritions.where().findAll(); // Consider adding sorting if needed.

  }




  Future<Nutrition?> getNutritionForDate(String date) async { // Return null if not found
    return isar.nutritions.where().dateEqualTo(date).findFirst(); // Use findFirst as only one unique date is expected

  }
  Future<void> addNutrition(Nutrition nutrition) async {
    await isar.writeTxn(() async {
      await isar.nutritions.put(nutrition);
    });
  }

  Future<void> deleteNutritionForDate(String date) async {
    await isar.writeTxn(() async {
      final query = isar.nutritions.filter().dateEqualTo(date).build();
      await query.deleteAll();
    });
  }





  //GOAL HOALDER
  Future<void> clearAllNutrition() async {
    await isar.writeTxn(() async {
      await isar.nutritions.clear();
    });

  }

  Future<NutritionGoalHolder?> getNutritionGoal() async {
    return isar.nutritionGoalHolders.where().isarIdEqualTo('primary').findFirst();
  }

  Future<void> upsertNutritionGoal(NutritionGoalHolder goal) async { // Use upsert for insert or update
    await isar.writeTxn(() async => await isar.nutritionGoalHolders.put(goal));
  }


}