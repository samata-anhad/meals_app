import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category.dart';
import 'package:meals_app/screens/filter.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/meal_drawer.dart';

var kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

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
  Map<Filter, bool> _selectFavouriteMeal = kInitialFilters;
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

  void _selectFavourite(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) =>  FilterScreen(currentFilter: _selectFavouriteMeal,)),
      );
      setState(() {
        _selectFavouriteMeal = result ?? kInitialFilters;
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if (_selectFavouriteMeal[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }

      if (_selectFavouriteMeal[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }

      if (_selectFavouriteMeal[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }

      if (_selectFavouriteMeal[Filter.vegan]! && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();
    Widget activePage = CategoryScreen(
      onToggleFavourite: _toggleMealFavouriteStatus, availableMeals: availableMeals,
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
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
