import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({ required this.title, required this.meals, super.key});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    //i created this function for the content of the screen
    // this is the content of the screen, which is the list view
   Widget content =  ListView.builder(
        itemCount: meals.length, itemBuilder:
       (context, index) =>  MealItem(meal: meals[index]));
     //if the list is empty, it will display a message here
    if (meals.isEmpty) {
      content = Center( child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text('Uh oh ... nothing here!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,)),
          Text('Try selecting a different category', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ) ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:content,
    );
  }
}
