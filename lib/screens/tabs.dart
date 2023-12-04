import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_grid_item.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
   void _selectPage(int index){
     setState(() {
       _selectedPageIndex = index;
     });
   }   
  @override
  Widget build(BuildContext context) {
  Widget activePage =const CategoriesScreen();
  var activePageTitle = 'Categories';
if (_selectedPageIndex == 1) {
      activePage = const MealsScreen( title:'Favorite', meals: []);
      activePageTitle = ' Your Favorite';  
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body:activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal, ),
            label:'Categories'  
          ),
          BottomNavigationBarItem(
               icon: Icon(Icons.star, ),
            label:'Favorites'  
          )
        ]
      )
    );
  }
}