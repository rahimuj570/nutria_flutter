import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/data/meal/entity/meal_entity.dart';

class ViewAllMealSearvice {
  ViewAllMealSearvice._();
  static final ViewAllMealSearvice _instance = ViewAllMealSearvice._();
  factory ViewAllMealSearvice() => _instance;

  final List<MealEntity> _breakfast = [
    MealEntity(title: 'Pizza', cal: 1100, imgPath: AppAssetsPath.fry),
    MealEntity(title: 'Cola', cal: 100, imgPath: AppAssetsPath.cola1),
    MealEntity(title: 'Juice', cal: 30, imgPath: AppAssetsPath.cola2),
    MealEntity(title: 'Burger', cal: 150, imgPath: AppAssetsPath.burger),
  ];
  final List<MealEntity> _lunch = [
    MealEntity(title: 'Pizza', cal: 1100, imgPath: AppAssetsPath.fry),
    MealEntity(title: 'Cola', cal: 100, imgPath: AppAssetsPath.cola1),
    MealEntity(title: 'Juice', cal: 30, imgPath: AppAssetsPath.cola2),
    MealEntity(title: 'Burger', cal: 150, imgPath: AppAssetsPath.burger),
  ];
  final List<MealEntity> _snacks = [
    MealEntity(title: 'Pizza', cal: 1100, imgPath: AppAssetsPath.fry),
    MealEntity(title: 'Cola', cal: 100, imgPath: AppAssetsPath.cola1),
    MealEntity(title: 'Juice', cal: 30, imgPath: AppAssetsPath.cola2),
    MealEntity(title: 'Burger', cal: 150, imgPath: AppAssetsPath.burger),
  ];
  final List<MealEntity> _dinner = [
    MealEntity(title: 'Pizza', cal: 1100, imgPath: AppAssetsPath.fry),
    MealEntity(title: 'Cola', cal: 100, imgPath: AppAssetsPath.cola1),
    MealEntity(title: 'Juice', cal: 30, imgPath: AppAssetsPath.cola2),
    MealEntity(title: 'Burger', cal: 150, imgPath: AppAssetsPath.burger),
  ];

  String getTitle(int mealId) {
    return switch (mealId) {
      0 => 'Breakfast',
      1 => 'Lunch',
      2 => 'Snacks',
      3 => 'Dinner',
      int() => throw UnimplementedError(),
    };
  }

  // String getImageAsset(int mealId) {
  //   return switch (mealId) {
  //     0 => AppAssetsPath.breakfast,
  //     1 => ,
  //     2 => 'Snacks',
  //     3 => 'Dinner',
  //     int() => throw UnimplementedError(),
  //   };
  // }

  List<MealEntity> getMealList(int mealId) {
    return switch (mealId) {
      0 => _breakfast,
      1 => _lunch,
      2 => _snacks,
      3 => _dinner,
      // TODO: Handle this case.
      int() => [],
    };
  }

  void addNewMeal(int mealId, MealEntity meal) {
    switch (mealId) {
      case 0:
        _breakfast.add(meal);
        break;
      case 1:
        _lunch.add(meal);
        break;
      case 3:
        _dinner.add(meal);
        break;
      case 2:
        _snacks.add(meal);
        break;
      default:
    }
  }
}
