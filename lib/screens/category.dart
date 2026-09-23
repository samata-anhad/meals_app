import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_items.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  //the Filtered Method Use To Select The Perfect Category passing the perfect data to perfect category screen
  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains((category.id)))
        .toList();

    // This is actually works as we just wants to swich in
    //between screens and we use statelesswidget the state change
    //cant be happen here we only wants to navigate
    //from one screen to another without state change
    Navigator.of(context).push( //similar like Navigator.push(context, Route)
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals:filteredMeals ),
      ),
    ); 
    //The MaterialPageRoute IS Just use like stack of screens/pages one screen below other screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('The Number Of Category')),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //how many coloumn will be there
          childAspectRatio:
              3 / 2, // How much size will be there between the columns
          crossAxisSpacing: 20, // Horizontal Spacing
          mainAxisSpacing: 20, // Vertical Spacing
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItems(
              category: category,
              onSelectCateGory: () {
                _selectedCategory(context, category);
              },
              // We create a function in Category items list as wants to select the categories of the dummydata
              //then pass the function inside Categoryitems where cin the function can pass the private function SelectedCategory and its context
            ), // we can use map insted of for in loop
        ],
      ),
    );
  }
}
