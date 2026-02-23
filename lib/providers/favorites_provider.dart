import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:gridapp/model/meal.dart';

class FavoriteMealNotifier extends  StateNotifier<List<Meal>>{
  FavoriteMealNotifier() : super([]);

void toggleMealFavoriteStatus(Meal meal){
  final mealIsFavorite = state.contains(meal);

  if(mealIsFavorite){
    state = state.where((meal) => meal.id != meal.id).toList();
  }
  else{
    state = [...state, meal];
  }

}
}
final favoriteMealsProvider = StateNotifierProvider<FavoriteMealNotifier, List<Meal>>((ref){
  return FavoriteMealNotifier();
});