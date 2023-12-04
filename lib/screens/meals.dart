import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details.dart';
import 'package:meal_app/widgets/meal_item.dart';
 

class MealsScreen extends StatelessWidget {
  const MealsScreen({this.title, required this.meals, super.key});

  final String?title;
  final List<Meal> meals;

  void selectMeal( BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => 
    MealDetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {

    //i created this function for the content of the screen
    // this is the content of the screen, which is the list view
   Widget content =  ListView.builder(
        itemCount: meals.length, itemBuilder:
       (context, index) =>  MealItem(meal: meals[index], onSelectMeal:( meal){
         selectMeal(context, meal);
       } ,));
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
    //!if the title is null, it will return the content of the screen without the title
   if (title == null) {
     return content;
   }
    return Scaffold(
      appBar: AppBar(
        //!if the title is not null, it will return the title of the screen
        title: Text(title!),
      ),
      body:content,
    );
  }
}
