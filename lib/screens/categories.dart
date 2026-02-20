import 'package:flutter/material.dart';
import 'package:gridapp/data/dummy_data.dart';
import 'package:gridapp/widgets/category_item.dart';
import 'package:gridapp/model/category.dart';
import 'package:gridapp/model/meal.dart';
import 'package:gridapp/screens/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals});

  final void Function(Meal meal) onToggleFavorite;

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context , Category category) {
    final filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggleFavorite: onToggleFavorite,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category)=> CategoryGridItem(categiry:categiry).toList())
          for (final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: (){
              _selectCategory(context, category);
            },),
        ],
      
    );
  }
}
