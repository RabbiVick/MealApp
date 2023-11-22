import 'package:meal_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
 const CategoryGridItem({required this.category, super.key});
//i imported this category data class
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
        )
      ),
      child: Text(
        category.title,style: Theme.of(context). textTheme.titleLarge!.copyWith(
// i used the exclamation mark to tell flutter the texttheme will be defined.
        color: Theme.of(context).colorScheme.onBackground,

      ),
      ),
    );
  }
}
