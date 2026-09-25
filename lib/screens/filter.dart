import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/meal_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<Filter, bool> currentFilter;

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FilterScreenState extends State<FilterScreen> {
  var _glutonFreeState = false;
  var _lactoseFreeState = false;
  var _vegetariyanState = false;
  var _veganState = false;

  void initState() {
    super.initState();
    _glutonFreeState = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeState = widget.currentFilter[Filter.lactoseFree]!;
    _vegetariyanState = widget.currentFilter[Filter.vegetarian]!;
    _veganState = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      //add The same drawer Used Insted of backbutun
      drawer: MealDrawer(
        onSelectFavourite: (identifier) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const TabsScreen()),
          );
        },
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutonFreeState,
            Filter.lactoseFree: _lactoseFreeState,
            Filter.vegetarian: _vegetariyanState,
            Filter.vegan: _veganState,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutonFreeState,
              onChanged: (isCheked) {
                setState(() {
                  _glutonFreeState = isCheked;
                });
              },
              title: Text(
                'Gluton-Free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include gluton-free meals',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),

            SwitchListTile(
              value: _lactoseFreeState,
              onChanged: (isCheked) {
                setState(() {
                  _lactoseFreeState = isCheked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),

            SwitchListTile(
              value: _vegetariyanState,
              onChanged: (isCheked) {
                setState(() {
                  _vegetariyanState = isCheked;
                });
              },
              title: Text(
                'Vegetariyan',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include Vegetariyan meals',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),

            SwitchListTile(
              value: _veganState,
              onChanged: (isCheked) {
                setState(() {
                  _veganState = isCheked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeThumbColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 24),
            ),
          ],
        ),
      ),
    );
  }
}
