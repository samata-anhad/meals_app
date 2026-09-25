import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/meal_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageindex = 0;
  final List<Meal> _favouriteMeals =
      []; //it is an empty lists which will contains The Meals

  //The Overlay After having the faviourite meal listed
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  //Toggle the star button to add/remove in the favourite screen
  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
      });
      _showMessage("Meal Is No Longer a Favourite");
    } else {
      setState(() {
        _favouriteMeals.add(meal);
      });
      _showMessage("Marked as Favourite");
    }
  }

  void _selectFavourite(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => const FilterScreen()));
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageindex == 1) {
      activePage = MealsScreen(
        title: 'Favourites',
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MealDrawer(onSelectFavourite: _selectFavourite),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), 
            label: 'Favourites'
            ),
        ],
      ),
    );
  }
}
