import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/meal_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutonFreeState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      //add The same drawer Used Insted of backbutun
      drawer: MealDrawer(onSelectFavourite: (identifier){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx)=>
        const TabsScreen()
        )
        );
      }),
      body: Column(
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
        ],
      ),
    );
  }
}
