import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/screens/meals.dart';
import '../models/category.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

//this function is to select a category from the grid
  void _selectCategory(BuildContext context, Category category) {
    // i used the where function to filter the dummyMeals list
    // so that only the items that have the same category as the selected category are returned
    //then i used contains to check if the category is in the list of selected categories
    // i then stored it in a variable filteredMeals
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your Category'),
      ),
      body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            //alternative way of doing the same thing
            //availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ]),
    );
  }
}
